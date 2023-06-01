import SwiftUI
import SNavigationAndTab

struct TimeTableCellView: View {
    var subject: String
    var body: some View {
        Text(subject)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.gray700)
            .frame(width: 56, height: 51)
            .border(Color.gray200, width: 1)
    }
}
