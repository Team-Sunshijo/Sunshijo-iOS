import SwiftUI
import SNavigationAndTab

struct TimeTableComponentView: View {
    let period: [String]
    let dayOfTheWeek: [String]
    let entity: [String]
    public init(entity: [String]) {
        self.period = ["1", "2", "3", "4", "", "5", "6", "7"]
        self.dayOfTheWeek = ["월", "화", "수", "목", "금"]
        self.entity = entity
    }
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer().frame(width: 30, height: 40)
                ForEach(dayOfTheWeek, id: \.self) {
                    Text($0)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.gray500)
                        .frame(width: 56, height: 40)
                }
            }
            ForEach(0..<8) { index in
                if index == 4 {
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
                    .padding(.leading, 30)
                } else {
                    HStack(spacing: 0) {
                        Text("\(period[index])")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.gray500)
                            .frame(width: 30, height: 51)
                        ForEach(entity, id: \.self) {
                            TimeTableCellView(subject: $0)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 28)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .shadowColor, radius: 10, x: 0, y: 2)
    }
}
