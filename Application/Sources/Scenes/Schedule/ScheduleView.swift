import SwiftUI
import SNavigationAndTab

struct ScheduleView: View, SNavigationAndTabContent {
    let viewModel: ScheduleViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "학사일정",
            tabItemImage: .schedule,
            backgroundColor: .gray50
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
