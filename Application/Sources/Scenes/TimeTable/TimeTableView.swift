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
        VStack(spacing: 0) {
            Spacer().frame(height: 78)
            Text("<  이번주 시간표  >")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray900)
            Spacer().frame(height: 15)
            TimeTableComponentView(entity: viewModel.time)
            Spacer()
        }
        .padding(.horizontal, 30)
        .onTabSelected(tabIndex: 0, perform: {
        })
    }
}
