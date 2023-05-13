import Foundation
import Moya

enum AuthAPI: TargetType {
    case signin(request: SigninRequest)
    case refreshToken(refreshToken: String)
}

extension AuthAPI {

    var baseURL: URL {
        return URL(string: "http://43.201.53.240:8000")!
    }

    var path: String {
        switch self {
        case .signin:
            return "/teachers/auth"
        case .refreshToken:
            return "/teachers/token"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signin, .refreshToken:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .signin(let request):
            return .requestJSONEncodable(request)
        default:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return ["Refresh-Token": "Bearer \(refreshToken)"]
        default:
            return nil
        }
    }

}
