import SwiftUI
import SNavigationAndTab
import SunshijoDesign

struct EtcView: View, SNavigationAndTabContent {
    let viewModel: EtcViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "더보기",
            tabItemImage: .etc,
            backgroundColor: .GrayScale.gray50
        )
    }
    var body: some View {
        VStack {
            Text("더보기")
        }
        .onTabSelected(tabIndex: 3, perform: {
        })
    }
}
