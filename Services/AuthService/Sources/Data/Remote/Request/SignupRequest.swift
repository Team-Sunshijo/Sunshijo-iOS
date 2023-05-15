import Foundation

struct SignupRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userId = "account_id"
        case profileFileImage = "profile_file_name"
        case password = "password"
    }
    let userName: String
    let userId: String
    let profileFileImage: String?
    let password: String
}
