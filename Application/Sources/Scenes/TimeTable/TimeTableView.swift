import SwiftUI
import SNavigationAndTab

struct TimeTableView: View, SNavigationAndTabContent {
    @StateObject var viewModel: TimeTableViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "시간표",
            tabItemImage: .timeTable,
            backgroundColor: .gray50
        )
    }
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(minHeight: 30, maxHeight: 78)
            Text("<  이번주 시간표  >")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.gray900)
            Spacer().frame(height: 15)
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Spacer().frame(width: 30, height: 40)
                    ForEach(viewModel.dayOfTheWeek, id: \.self) {
                        Text($0)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.gray500)
                            .frame(width: 56, height: 40)
                    }
                }
                ForEach(0..<4) { index in
                    HStack(spacing: 0) {
                        Text("\(index+1)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.gray500)
                            .frame(width: 30, height: 51)
                        ForEach(viewModel.timeTable[index], id: \.subject) {
                            TimeTableCellView(subject: $0.subject)
                        }
                    }
                }
                HStack {
                    Spacer()
                        .frame(width: 30)
                    VStack(spacing: 0) {
                        Rectangle().frame(height: 0)
                        Text("즐거운 점심시간")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(Color.white)
                            .frame(height: 51)
                    }
                    .border(Color.gray200)
                    .frame(width: 280)
                    .background(Color.main700)
                }
                ForEach(4..<7) { index in
                    HStack(spacing: 0) {
                        Text("\(index+1)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.gray500)
                            .frame(width: 30, height: 51)
                        ForEach(viewModel.timeTable[index], id: \.subject) {
                            TimeTableCellView(subject: $0.subject)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 28, leading: 10, bottom: 28, trailing: 10))
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .shadowColor, radius: 10, x: 0, y: 2)
            Spacer()
        }
        .padding(.horizontal, 30)
        .onAppear { viewModel.fetchTimeTable() }
        .onTabSelected(tabIndex: 0, perform: {
            viewModel.fetchTimeTable()
        })
    }
}
