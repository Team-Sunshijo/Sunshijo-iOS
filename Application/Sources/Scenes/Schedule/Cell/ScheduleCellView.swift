import SwiftUI
import SunshijoDesign

struct ScheduleCellView: View {
    var dayText: String
    var dayofWeekText: String
    var scheduleName: String

    var body: some View {
        HStack {
            Color.Primary.main
                .cornerRadius(20)
                .frame(width: 8, height: 50)
            VStack {
                Text(dayText)
                    .sdText(type: .semiBold16, textColor: .GrayScale.gray900)
                Text(dayofWeekText)
                    .sdText(type: .regular10, textColor: .GrayScale.gray900)
            }
            .frame(width: 22)
            .padding(.leading, 18)
            Text(scheduleName)
                .sdText(type: .medium16, textColor: .GrayScale.gray900)
                .padding(.trailing, 20)
            Spacer()
        }
        .padding(.bottom, 15)
       
    }
}
