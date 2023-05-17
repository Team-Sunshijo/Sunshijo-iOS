import SwiftUI

struct AuthButton: View {
    @Binding var isDisabled: Bool
    var buttonTitle: String
    var action: () -> Void
    public init(
        isDisabled: Binding<Bool> = .constant(false),
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        self._isDisabled = isDisabled
        self.buttonTitle = buttonTitle
        self.action = action
    }
    var body: some View {
        VStack {
            Button(action: action) {
                Text(buttonTitle)
            }
            .frame(height: 40)
            .padding([.leading, .trailing], 70)
            .background(SunshijoIOSAsset.Colors.main2.swiftUIColor)
            .foregroundColor(SunshijoIOSAsset.Colors.white.swiftUIColor)
            .cornerRadius(5)
            .disabled(isDisabled)
        }
    }
}
