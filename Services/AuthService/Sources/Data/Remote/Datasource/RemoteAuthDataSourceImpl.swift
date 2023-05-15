import Foundation

import Moya
import RxSwift
import RxMoya

class RemoteAuthDataSourceImpl: RemoteAuthDataSource {
    private let provider = MoyaProvider<AuthAPI>()

    func signin(request: SigninRequest) -> Single<SigninAndRefreshTokenResponse> {
        self.provider.rx.request(.signin(request: request))
            .map(SigninAndRefreshTokenResponse.self)
            .do(onError: {
                print("error")
                print($0)
            })
    }
    func signup(request: SignupRequest) -> RxSwift.Completable {
        self.provider.rx.request(.signup(request: request))
            .asCompletable()
    }
    func refreshToken(refreshToken: String) -> Single<SigninAndRefreshTokenResponse> {
        self.provider.rx.request(.refreshToken(refreshToken: refreshToken))
            .map(SigninAndRefreshTokenResponse.self)
    }

}
