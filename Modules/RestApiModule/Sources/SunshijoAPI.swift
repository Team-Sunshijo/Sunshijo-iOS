import Foundation

import Moya
import AuthService

public protocol SunshijoAPI: TargetType, JWTTokenAuthorizable {
    var domain: String { get }
    var urlPath: String { get }
    var errorMapper: [Int: Error]? { get }
}

public extension SunshijoAPI {

    var baseURL: URL {
        return URL(string: "http://3.36.159.7:8080")!
    }

    var path: String {
        return domain+urlPath
    }

    var task: Task { .requestPlain }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }

}
