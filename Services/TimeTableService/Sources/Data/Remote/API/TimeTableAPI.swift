import Foundation

import AuthService
import RestApiModule
import Moya

enum TimeTableAPI {
    case fetchTimeTable(grade: Int, classNum: Int)
}

extension TimeTableAPI: SunshijoAPI {

    var domain: String {
        return "/timetable"
    }

    var urlPath: String {
        switch self {
        case .fetchTimeTable:
            return ""
        }
    }

    var errorMapper: [Int: Error]? {
        [
            400: TimeTableServiceError.badRequest,
            401: TimeTableServiceError.unauthorized,
            403: TimeTableServiceError.forbidden,
            404: TimeTableServiceError.notFound,
            409: TimeTableServiceError.conflict,
            429: TimeTableServiceError.tooManyRequests,
            500: TimeTableServiceError.internalServerError
        ]
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .fetchTimeTable(let grade, let classNum):
            return .requestParameters(parameters:
                                        [
                                            "grade": grade,
                                            "class": classNum
                                        ], encoding: URLEncoding.queryString)
        }
    }
    var jwtTokenType: JWTTokenType {
        return .none
    }
}
