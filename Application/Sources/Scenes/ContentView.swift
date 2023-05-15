import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sunshijoRouter: SunshijoRouter

    var body: some View {
        sunshijoRouter.start()
    }
}
