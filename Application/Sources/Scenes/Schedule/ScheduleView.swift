import SwiftUI
import SNavigationAndTab
import SunshijoDesign
struct ScheduleView: View, SNavigationAndTabContent {
    @State var date = Date()
    let viewModel: ScheduleViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "학사일정",
            tabItemImage: .schedule,
            backgroundColor: .GrayScale.gray50
        )
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("학사일정")
                        .sdText(type: .semiBold24, textColor: .GrayScale.gray900)
                        .padding(.top, 5)
                        .padding(.leading, 40)
                    Spacer()
                }
                SDCalendar(date: $date, specialDays: viewModel.specialDays)
                    .padding(.top, 15)
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color(.white))
            .edgesIgnoringSafeArea([.top])
            .shadow(radius: 8, x: 0, y: 5)
        )
        .frame(height: 400)
        Spacer().frame(height: 35)
        VStack {
        }
    }
}
