import SwiftUI

struct LoginButton: View {
    var buttonTitle: String
    var body: some View {
        HStack {
          Text("계정이 있으신가요?")
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(SunshijoIOSAsset.Colors.gray700.swiftUIColor)
          Button(buttonTitle) {}
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(SunshijoIOSAsset.Colors.gray900.swiftUIColor)
                .padding(.leading, 9)
        }
        .padding(.top, 15)
    }
}
