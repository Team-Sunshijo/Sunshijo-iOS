import SwiftUI

@main
struct SunshijoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let sunshijoRouter = SunshijoRouter(rootScreen: .signup, factory: .init())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sunshijoRouter)
        }
    }
}