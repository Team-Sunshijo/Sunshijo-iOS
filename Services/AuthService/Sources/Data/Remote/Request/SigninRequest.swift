import Foundation

struct SigninRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case password = "password"
    }
    let id: String
    let password: String
}
