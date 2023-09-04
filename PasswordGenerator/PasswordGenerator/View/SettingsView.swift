//
//  SettingsView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("DISPLAY"),footer: Text("Enabling dark mode is going to change the entire appearance of the application, beyond your device's general settings. ")){
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 30,height: 30)
                                .foregroundColor(.orange)
                            Image(systemName: "moon.fill")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        Toggle("Dark Mode" , isOn: $isDarkModeEnabled)
                            .tint(.orange)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
        }
    }
    
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

