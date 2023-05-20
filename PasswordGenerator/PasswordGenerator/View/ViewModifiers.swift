//
//  ViewModifiers.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import Foundation
import SwiftUI


extension View{
    func centerH() -> some View{
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View{
        NavigationView{
            self.navigationTitle(title)
        }
    }
}
