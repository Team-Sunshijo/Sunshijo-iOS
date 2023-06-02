import Foundation

struct TimeTableListResponse: Decodable {
    let timetableList: [TimeTableResponse]

    enum CodingKeys: String, CodingKey {
        case timetableList = "timetable_list"
    }
}

extension TimeTableListResponse {
    func toDomain() -> [TimeTableEntity] {
        return self.timetableList.map {
            $0.toDomain()
        }
    }
}
