import SwiftUI

import SunshijoDesign

struct NavigationBackButtonWithRouter: ViewModifier {
    @EnvironmentObject var sunshijoRouter: SunshijoRouter
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Spacer().frame(width: 6)
                        Button {
                            self.sunshijoRouter.dismissLast()
                        } label: {
                            Image("BackButton")
                                .font(.system(size: 24))
                                .tint(.GrayScale.gray200)
                        }
                    }
                }
            }
    }
}

extension View {
    func setNavigationBackButtonWithRouter() -> some View {
        self.modifier(NavigationBackButtonWithRouter())
    }
}
