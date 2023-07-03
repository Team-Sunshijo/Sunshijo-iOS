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
    
}
