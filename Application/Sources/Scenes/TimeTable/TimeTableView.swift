import SwiftUI
import SNavigationAndTab

struct TimeTableView: View, SNavigationAndTabContent {
    let viewModel: TimeTableViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "시간표",
            tabItemImage: .timeTable,
            backgroundColor: .gray50
        )
    }
    var body: some View {
        VStack {
            Text("시간표")
        }
        .onTabSelected(tabIndex: 0, perform: {

        })
    }
}
