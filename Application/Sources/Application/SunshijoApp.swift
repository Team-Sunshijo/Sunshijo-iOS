import SwiftUI

@main
struct SunshijoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let sunshijoRouter = SunshijoRouter(rootScreen: .launch, factory: .init())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sunshijoRouter)
        }
    }
}
