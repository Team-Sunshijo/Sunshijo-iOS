import Foundation

struct SignupRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case userName = "name"
        case userId = "account_id"
        case signupCode = "sign_up_code"
        case password = "password"
    }
    let userName: String
    let userId: String
    let signupCode: String
    let password: String
}
