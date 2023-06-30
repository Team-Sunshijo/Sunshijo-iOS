import Foundation

public struct AuthServiceDependency {

    public static let shared = Self.resolve()

    public let checkIsTokenValidUseCase: CheckIsTokenValidUseCase
    public let fetchAccessTokenUseCase: FetchAccessTokenUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
    public let refreshTokenIfExpiredUseCase: RefreshTokenIfExpiredUseCase
    public let signinUseCase: SigninUseCase
    public let signupUseCase: SignupUseCase
    public let logoutUseCase: LogoutUseCase
    public let jwtPlugin: JWTPlugin
}

extension AuthServiceDependency {
    static func resolve() -> AuthServiceDependency {
        // MARK: - Datasources
        let remoteAuthDataSource: RemoteAuthDataSource = RemoteAuthDataSourceImpl()
        let localTokenDataSource: LocalTokenDataSource = LocalTokenDataSourceImpl()

        // MARK: - Respositories
        let authRepository: AuthRepository = AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            localTokenDataSource: localTokenDataSource
        )

        // MARK: - UseCases
        let checkIsTokenValidUseCase = CheckIsTokenValidUseCase(
            authRepository: authRepository
        )
        let fetchAccessTokenUseCase = FetchAccessTokenUseCase(
            authRepository: authRepository
        )
        let refreshTokenUseCase = RefreshTokenUseCase(
            authRepository: authRepository
        )
        let refreshTokenIfExpiredUseCase = RefreshTokenIfExpiredUseCase(
            authRepository: authRepository
        )
        let signinUseCase = SigninUseCase(
            authRepository: authRepository
        )
        let signupUseCase = SignupUseCase(
            authRepository: authRepository
        )
        let logoutUserCase = LogoutUseCase(
            repository: authRepository
        )

        // MARK: - Plugin
        let jwtPlugin = JWTPlugin(
            localTokenDataSource: localTokenDataSource
        )

        return AuthServiceDependency(
            checkIsTokenValidUseCase: checkIsTokenValidUseCase,
            fetchAccessTokenUseCase: fetchAccessTokenUseCase,
            refreshTokenUseCase: refreshTokenUseCase,
            refreshTokenIfExpiredUseCase: refreshTokenIfExpiredUseCase,
            signinUseCase: signinUseCase,
            signupUseCase: signupUseCase,
            logoutUseCase: logoutUserCase,
            jwtPlugin: jwtPlugin
        )
    }
}
