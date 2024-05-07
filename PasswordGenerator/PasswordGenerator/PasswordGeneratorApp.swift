//
//  PasswordGeneratorApp.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import SwiftUI
import SwiftData

@main
struct PasswordGeneratorApp: App {
    var body: some Scene {
        WindowGroup {
            TabControllerView()
        }
        .modelContainer(for: [Password.self,Categories.self])
    }
}
