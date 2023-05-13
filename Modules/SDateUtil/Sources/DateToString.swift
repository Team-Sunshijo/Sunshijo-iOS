import Foundation

public extension Date {

    func toString(format: DateFormat) -> String {
        return self.toString(format: format.rawValue)
    }

    func toString(format: String) -> String {
        SDateFormatter.shared.dateFormat = format
        return SDateFormatter.shared.string(from: self)
    }

}
