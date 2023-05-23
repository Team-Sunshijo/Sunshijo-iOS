import SwiftUI
import SNavigationAndTab

struct EvaluationView: View, SNavigationAndTabContent {
    let viewModel: EvaluationViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "수행평가",
            tabItemImage: .evaluation,
            backgroundColor: .gray50
        )
    }
    var body: some View {
        VStack {
            EvaluationTitle(
                title: "나의 수행평가",
                count: 5
            )
            ScrollView {
                Spacer().frame(height: 10)
                EvaluationCell(
                    title: "수학 수행평가",
                    teacher: "고진영 선생님",
                    detailText: "그래프 그리기 수행평가 안내.."
                )
            }
        }
        .onTabSelected(tabIndex: 2, perform: {

        })
    }
}
