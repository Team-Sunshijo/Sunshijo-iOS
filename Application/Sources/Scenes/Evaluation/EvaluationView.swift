import SwiftUI
import SNavigationAndTab
import SunshijoDesign

struct EvaluationView: View, SNavigationAndTabContent {
    @State private var isDetailViewShown = false

    let viewModel: EvaluationViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "수행평가",
            tabItemImage: .evaluation,
            backgroundColor: isDetailViewShown ?   Color.black.opacity(0.5) : .GrayScale.gray50
        )
    }
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 15) {
                    Text("나의 수행평가")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.top, 45)
                        .padding(.leading, 40)
                    Text("1")
                        .padding(.vertical, 3)
                        .padding(.horizontal, 12)
                        .background(Color.Primary.main4)
                        .cornerRadius(12)
                        .padding(.top, 49)
                        .foregroundColor(.Primary.main)
                    Spacer()
                }
                ScrollView {
                    Spacer().frame(height: 10)
                    Button(action: {
                        isDetailViewShown = true
                    }) { 
                        EvaluationCell(
                            title: "수학 수행평가",
                            teacher: "고진영 선생님",
                            detailText: "그래프 그리기 수행평가 안내..",
                            dateText: "2020-09-02"
                        )
                    }
                }
            }
            .onTabSelected(tabIndex: 2, perform: { })

            if isDetailViewShown {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isDetailViewShown = false
                    }

                EvaluationDetailView()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 80, trailing: 20))
                    .frame(width: 330, height: 350)
                    .background(Color.white)
                    .cornerRadius(20)
                Button("") {
                    isDetailViewShown = false
                }
                .padding(.bottom, 30)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
    }
}
