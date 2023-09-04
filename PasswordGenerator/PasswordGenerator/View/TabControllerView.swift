//
//  TabNavigationView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI

struct TabControllerView: View {
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        TabView{
            GeneratorView()
                .tabItem(){
                    Image(systemName: "shield.fill")
                    Text("Generator")
                }
            AdapterView()
                .tabItem(){
                    Image(systemName: "ellipsis.rectangle.fill")
                    Text("Custom")
                }
            PasswordsView()
                .tabItem(){
                    Image(systemName: "lock.fill")
                    Text("Passwords")
                }
            SettingsView()
                .tabItem(){
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .tint(.orange)
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)

    }
}

struct TabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        TabControllerView()
    }
}
