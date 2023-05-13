import Foundation

import RxSwift

protocol RemoteAuthDataSource {
    func signin(request: SigninRequest) -> Single<SigninAndRefreshTokenResponse>
    func refreshToken(refreshToken: String) -> Single<SigninAndRefreshTokenResponse>
}
