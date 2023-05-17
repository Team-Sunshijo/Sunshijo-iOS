import SwiftUI

struct GoToButton: View {
    var title: String
    var buttonTitle: String
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
          Text(title)
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(SunshijoIOSAsset.Colors.gray700.swiftUIColor)
          Button(buttonTitle) {}
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(SunshijoIOSAsset.Colors.gray900.swiftUIColor)
                .padding(.leading, 11)
        }
        .padding(.top, 16)
    }
}
