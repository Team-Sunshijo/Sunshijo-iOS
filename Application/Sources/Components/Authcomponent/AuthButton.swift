import SwiftUI

struct AuthButton: View {
    var buttonTitle: String
    var action: () -> ()
    public init(buttonTitle: String, action: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.action = action
    }
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
