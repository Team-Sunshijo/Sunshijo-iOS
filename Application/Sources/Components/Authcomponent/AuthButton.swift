import SwiftUI

struct AuthButton: View {
    var buttonTitle: String

    var body: some View {
        VStack {
            Button(buttonTitle) {
            }
            .frame(height: 40)
            .padding([.leading, .trailing], 70)
            .background(SunshijoIOSAsset.Colors.main2.swiftUIColor)
            .foregroundColor(SunshijoIOSAsset.Colors.white.swiftUIColor)
            .cornerRadius(5)
        }
    }
}
