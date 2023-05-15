import Foundation

public struct SignupEntity {
    let userName: String
    let userId: String
    let profileFileImageUrl: URL?
    let password: String
    public init(
        userName: String,
        userId: String,
        profileFileImage: URL?,
        password: String
    ) {
        self.userName = userName
        self.userId = userId
        self.profileFileImageUrl = profileFileImage
        self.password = password
    }
}

extension SignupEntity {
    func toSignupRequest() -> SignupRequest {
        return .init(
            userName: self.userName,
            userId: self.userId,
            profileFileImage: self.profileFileImageUrl?.absoluteString,
            password: self.password
        )
    }
}
