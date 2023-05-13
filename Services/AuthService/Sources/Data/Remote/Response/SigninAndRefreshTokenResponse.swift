import Foundation

struct SigninAndRefreshTokenResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expirationAt = "access_token_exp"
    }

    let accessToken: String
    let refreshToken: String
    let expirationAt: String

}
