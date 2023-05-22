import SwiftUI
import SNavigationAndTab

struct EvaluationView: View, SNavigationAndTabContent {
    let viewModel: EvaluationViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "시간표",
            tabItemImage: .evaluation)
    }
    var body: some View {
        VStack {
            EvaluationTitle(
                title: "나의 수행평가",
                count: 5
            )
            List {
                EvaluationCell()
                    .frame(height: 100)
                    .padding([.leading, .trailing], 30)
            }
            .onTabSelected(tabIndex: 2, perform: {

            })
        }
    }
}
