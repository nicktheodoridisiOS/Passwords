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
                    Image(systemName: "lock.circle.fill")
                    Text("Generator")
                }
            AdapterView()
                .tabItem(){
                    Image(systemName: "plus.circle.fill")
                    Text("Creator")
                }
            PasswordsView()
                .tabItem(){
                    Image(systemName: "ellipsis.circle.fill")
                    Text("Passwords")
                }
        }
        .tint(.blue)

    }
}

struct TabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        TabControllerView()
    }
}
