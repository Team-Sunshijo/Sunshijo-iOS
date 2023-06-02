import SwiftUI
import SNavigationAndTab
import SunshijoDesign

struct TimeTableCellView: View {
    var subject: String
    var body: some View {
        Text(subject)
            .sdText(type: .semiBold16, textColor: .GrayScale.gray700)
            .frame(width: 56, height: 51)
            .border(Color.GrayScale.gray200, width: 1)
    }
}
