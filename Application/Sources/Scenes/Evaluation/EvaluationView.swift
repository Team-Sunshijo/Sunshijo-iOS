import SwiftUI
import SNavigationAndTab
import SunshijoDesign

struct EvaluationView: View, SNavigationAndTabContent {
    let viewModel: EvaluationViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "수행평가",
            tabItemImage: .evaluation,
            backgroundColor: .GrayScale.gray50
        )
    }
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Text("나의 수행평가")
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top, 45)
                    .padding(.leading, 40)
                Text("5")
                    .padding(.top, 54)
                    .foregroundColor(.Primary.main)
                Spacer()
            }
            ScrollView {
                Spacer().frame(height: 10)
                EvaluationCell(
                    title: "수학 수행평가",
                    teacher: "고진영 선생님",
                    detailText: "그래프 그리기 수행평가 안내..",
                    dateText: "2020-09-02"
                )
            }
        }
        .onTabSelected(tabIndex: 2, perform: {

        })
    }
}
