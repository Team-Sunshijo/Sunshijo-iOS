import SwiftUI
import SNavigationAndTab

struct EtcView: View, SNavigationAndTabContent {
    let viewModel: EtcViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "시간표",
            tabItemImage: .etc)
    }
    var body: some View {
        VStack {
            Text("더보기")
        }
        .onTabSelected(tabIndex: 3, perform: {
        })
    }
}
