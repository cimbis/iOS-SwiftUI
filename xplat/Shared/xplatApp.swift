//
//  xplatApp.swift
//  Shared
//
//  Created by Janis Cimbulis on 28/11/2020.
//

import SwiftUI

@main
struct xplatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
