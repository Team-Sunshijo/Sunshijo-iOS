import Foundation

public struct SignupEntity {
    let userName: String
    let userId: String
    let signupCode: String
    let password: String
    public init(
        userName: String,
        userId: String,
        signupCode: String,
        password: String
    ) {
        self.userName = userName
        self.userId = userId
        self.signupCode = signupCode
        self.password = password
    }
}

extension SignupEntity {
    func toSignupRequest() -> SignupRequest {
        return .init(
            userName: self.userName,
            userId: self.userId,
            signupCode: self.signupCode,
            password: self.password
        )
    }
}
