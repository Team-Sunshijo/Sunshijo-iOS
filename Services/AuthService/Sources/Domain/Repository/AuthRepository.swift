import Foundation

import RxSwift

public protocol AuthRepository {
    func signin(signinEntity: SigninEntity) -> Completable
    func refreshToken() -> Completable
    func fetchAccessToken() throws -> String
    func fetchTokenExpiredDate() throws -> Date
}
