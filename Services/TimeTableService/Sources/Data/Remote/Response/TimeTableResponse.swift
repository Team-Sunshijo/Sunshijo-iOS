import Foundation

struct TimeTableResponse: Decodable {
    let grade: Int
    let classNum: Int
    let period: Int
    let weekOfDate: Int
    let subject: String

    enum CodingKeys: String, CodingKey {
        case grade
        case classNum = "class_num"
        case period
        case weekOfDate = "week_of_date"
        case subject
    }
}

extension TimeTableResponse {
    func toDomain() -> TimeTableEntity {
        return .init(
            grade: self.grade,
            classNum: self.classNum,
            period: self.period,
            weekOfDate: self.weekOfDate,
            subject: self.subject
        )
    }
}
