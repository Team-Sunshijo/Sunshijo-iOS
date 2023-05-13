import Foundation

public extension String {
    func toDate(format: DateFormat) -> Date {
        SDateFormatter.shared.dateFormat = format.rawValue
        guard let returnDate = SDateFormatter.shared.date(from: self) else {
            print("toDate Error: Date로 format하려는 데이터의 형식이 DateFormat과 일치하지 않습니다.")
            return Date()
        }
        return returnDate
    }
}
