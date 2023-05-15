import SwiftUI

struct SignupButton: View {
    var buttonTitle: String
    var body: some View {
        HStack(alignment: .center) {
          Text("계정이 없으신가요?")
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
