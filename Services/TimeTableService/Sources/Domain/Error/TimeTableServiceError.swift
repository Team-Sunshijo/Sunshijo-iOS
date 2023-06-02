import Foundation

public enum TimeTableServiceError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case tooManyRequests
    case internalServerError
}

public extension Error {
    var asTimeTableServiceError: TimeTableServiceError? {
        self as? TimeTableServiceError
    }
}
