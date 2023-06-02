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
        VStack(alignment: .leading, spacing: 0) {
            Text("학사일정")
                .font(.system(size: 24, weight: .semibold))
                .padding(.top, 45)
                .padding(.leading, 41)
            VStack {
                HStack(spacing: 5) {
                    Text("5월")
                        .font(.system(size: 16, weight: .medium))
                }
            }
            .padding(.leading, 41)
            .padding(.top, 15)
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 35) {
                    ForEach(viewModel.dayOfWeek, id: \.self) {
                        Text($0)
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                .padding(.leading, 41)
                .padding(.top, 43)
            }
            
            ScrollView {
                
            }
        
        }
    }
}
