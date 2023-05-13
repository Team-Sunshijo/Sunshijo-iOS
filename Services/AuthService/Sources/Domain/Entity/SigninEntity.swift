import Foundation

public struct SigninEntity {
    let id: String
    let password: String

    public init(
        id: String,
        password: String
    ) {
        self.id = id
        self.password = password
    }
}

extension SigninEntity {
    func toSigninRequest() -> SigninRequest {
        return .init(
            id: self.id,
            password: self.password
        )
    }
}
