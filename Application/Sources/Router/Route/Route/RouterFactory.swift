import Foundation

import SwiftUI
import SNavigationAndTab

protocol RouterFactory {
    associatedtype Body: View
    associatedtype Screen: ScreenProtocol

    @ViewBuilder func makeBody(for screen: Screen) -> Self.Body
}
