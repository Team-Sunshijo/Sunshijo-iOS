import Foundation

import Moya
import RxSwift

class AuthRepositoryImpl: AuthRepository {

    private let remoteAuthDataSource: RemoteAuthDataSource
    private let localTokenDataSource: LocalTokenDataSource

    init(remoteAuthDataSource: RemoteAuthDataSource,
         localTokenDataSource: LocalTokenDataSource) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localTokenDataSource = localTokenDataSource
    }

    func signin(signinEntity: SigninEntity) -> Completable {
        self.remoteAuthDataSource.signin(request: signinEntity.toSigninRequest())
            .do(onSuccess: { [weak self] tokenResponse in
                self?.localTokenDataSource.registerAccessToken(tokenResponse.accessToken)
                self?.localTokenDataSource.registerRefreshToken(tokenResponse.refreshToken)
                self?.localTokenDataSource.registerExpiredAt(tokenResponse.expirationAt)
            }).catch { error in
                let moyaError = error as? MoyaError
                guard moyaError?.response?.statusCode != nil else {
                    return .error(AuthServiceError.internalServerError) }
                return .error(AuthServiceError.notFound)
            }.asCompletable()
    }
    func signup(signupEntity: SignupEntity) -> Completable {
        self.remoteAuthDataSource.signup(request: signupEntity.toSignupRequest())
            .catch { [weak self] error in
                let moyaError = error as? MoyaError
                guard moyaError?.response?.statusCode != nil else {
                    return .error(AuthServiceError.internalServerError) }
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 409: return .error(AuthServiceError.conflict)
                default: return .error(error)
                }
            }
    }
    func refreshToken() -> Completable {
        guard let refershToken = self.localTokenDataSource.fetchRefreshToken() else {
            return Completable.error(AuthServiceError.unauthorized)
        }
        return self.remoteAuthDataSource.refreshToken(refreshToken: refershToken)
            .do(onSuccess: { [weak self] tokenResponse in
                self?.localTokenDataSource.registerAccessToken(tokenResponse.accessToken)
                self?.localTokenDataSource.registerRefreshToken(tokenResponse.refreshToken)
                self?.localTokenDataSource.registerExpiredAt(tokenResponse.expirationAt)
            }).catch { [weak self] error in
                let moyaError = error as? MoyaError
                guard moyaError?.response?.statusCode != nil else {
                    return .error(AuthServiceError.internalServerError) }
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 401: return .error(AuthServiceError.unauthorized)
                default: return .error(error)
                }
            }.asCompletable()
    }

    func fetchAccessToken() throws -> String {
        guard let accessToken = self.localTokenDataSource.fetchAccessToken() else {
            throw AuthServiceError.unauthorized
        }
        return accessToken
    }

    func fetchTokenExpiredDate() throws -> Date {
        guard let expiredDate = self.localTokenDataSource.fetchExpiredDate() else {
            throw AuthServiceError.unauthorized
        }
        return expiredDate
    }

    func logout() -> Completable {
        Completable.create { completable in
            self.localTokenDataSource.resetToken()
            completable(.completed)
            return Disposables.create()
        }
    }

}

extension AuthRepositoryImpl {

    private func errorToStatusCode(_ error: Error) -> Int? {
        guard let statusCode = (error as? MoyaError)?.response?.statusCode else {
            return nil
        }
        return statusCode
    }

}
