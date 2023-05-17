import Foundation

public struct AuthServiceDependency {

    public static let shared = Self.resolve()

    public let signinUseCase: SigninUseCase
    public let signupUseCase: SignupUseCase
    public let jwtPlugin: JWTPlugin
}

extension AuthServiceDependency {
    static func resolve() -> AuthServiceDependency {
        // MARK: - Datasources
        let remoteAuthDataSource: RemoteAuthDataSource = RemoteAuthDataSourceImpl()
        let loaclTokenDataSource: LoaclTokenDataSource = LoaclTokenDataSourceImpl()

        // MARK: - Respositories
        let authRepository: AuthRepository = AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            loaclTokenDataSource: loaclTokenDataSource
        )

        // MARK: - UseCases
        let signinUseCase = SigninUseCase(
            authRepository: authRepository
        )
        let signupUseCase = SignupUseCase(
            authRepository: authRepository
        )

        // MARK: - Plugin
        let jwtPlugin = JWTPlugin(
            loaclTokenDataSource: loaclTokenDataSource
        )

        return AuthServiceDependency(
            signinUseCase: signinUseCase,
            signupUseCase: signupUseCase,
            jwtPlugin: jwtPlugin
        )
    }
}
