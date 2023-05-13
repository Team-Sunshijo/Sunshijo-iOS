import Foundation

public enum AuthServiceError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case tooManyRequests
    case internalServerError
}

public extension Error {
    var asAuthServiceError: AuthServiceError? {
        self as? AuthServiceError
    }
}
