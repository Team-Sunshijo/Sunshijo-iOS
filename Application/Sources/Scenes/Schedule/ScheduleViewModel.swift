import SwiftUI
import SunshijoDesign

class ScheduleViewModel: ObservableObject {
    let specialDays = [
                       "2023 03 02".toDate("yyyy MM dd"),
                       "2023 03 03".toDate("yyyy MM dd"),
                       "2023 05 04".toDate("yyyy MM dd"),
                       "2023 05 05".toDate("yyyy MM dd"),
                       "2023 05 22".toDate("yyyy MM dd")
    ]
    let cell = [
        ScheduleCell(day: "1", dayOfWeek: "토", scheduleName: "Df"),
        ScheduleCell(day: "fd", dayOfWeek: "SDf", scheduleName: "DFS"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf"),
        ScheduleCell(day: "sdf", dayOfWeek: "sdf", scheduleName: "sdf")

    ]
}

struct ScheduleCell: Hashable {
    let day: String
    let dayOfWeek: String
    let scheduleName: String
}
