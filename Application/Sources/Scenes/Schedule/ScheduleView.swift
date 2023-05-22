import SwiftUI
import SNavigationAndTab

struct ScheduleView: View, SNavigationAndTabContent {
    let viewModel: ScheduleViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "시간표",
            tabItemImage: .schedule
        )
    }
    var body: some View {
        VStack {
            Text("학사일정")
        }
//        .onTabSelected(tabIndex: 1, perform: {
//                
//        })
    }
}
