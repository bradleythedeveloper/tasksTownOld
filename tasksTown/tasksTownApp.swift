//
//  tasksTownApp.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import SwiftUI

@main
struct tasksTownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
        //.windowResizability(.contentSize)
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
