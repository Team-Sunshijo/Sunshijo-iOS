//
//  ContentView.swift
//  Sunshijo
//
//  Created by 박도연 on 2023/05/10.
//  Copyright © 2023 com.kodomo. All rights reserved.
//

import SwiftUI

@main
struct ContentView: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
