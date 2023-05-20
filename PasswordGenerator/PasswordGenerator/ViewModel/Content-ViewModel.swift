//
//  Content-ViewModel.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import Foundation
import SwiftUI

extension ContentView{
    class ViewModel: ObservableObject{
        @Published var passwords: [Password] = []
        @Published var containsSymbol = true
        @Published var containsUppercase = false
        @Published var length = 10
        
        init(){
            createPassword()
        }
        
        func createPassword(){
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if containsSymbol{
                base += "!£$%&/()=?^;:_*,.-"
            }
            if containsUppercase{
                base += alphabet.uppercased()
            }
            
            for _ in 0..<length{
                let randomCharacter = base.randomElement()!
                newPassword += String(randomCharacter)
            }
            
            let password =   Password(password: newPassword, containsSymbol: containsSymbol, containsUppercase: containsUppercase)
            
            withAnimation{
                passwords.insert(password, at: 0)
            }
        }
    }
}
