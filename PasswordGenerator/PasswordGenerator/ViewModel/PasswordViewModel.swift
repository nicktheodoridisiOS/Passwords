//
//  Content-ViewModel.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import Foundation
import SwiftUI


class PasswordViewModel: ObservableObject{
    @Published var passwords: [Password] = []
    @Published var containsSymbol = false
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
    
    func checkStrength(_ password: String) -> String {
        let passwordLength = password.count
        var containsSymbol = false
        var containsNumbers = false
        var containsUpperCase = false
        
        for character in password{
            if "ABCDEFGHIGKLMNOPQRSTUVWXYZ".contains(character){
                containsUpperCase = true
            }
            
            if "1234567890".contains(character){
                containsNumbers = true
            }
            
            if "!£$%&/()=?^;:_*,.-".contains(character){
                containsSymbol = true
            }
        }
        
        if passwordLength > 8 && containsSymbol && containsUpperCase && containsNumbers{
            return "Strong"
        }
        else if ((passwordLength > 6 && containsUpperCase) || (passwordLength > 6 && containsSymbol) || (passwordLength > 6 && containsNumbers)){
            return "Medium"
        }
        else {
            return "Weak"
        }
    }
    
    func checkIfContainsSymbol(_ password: String) -> Bool {
        
        for character in password{
            if "!£$%&/()=?^;:_*,.-".contains(character){
                return true
            }
        }
        
        return false
    }
    
    func checkIfContainsNumbers(_ password: String) -> Bool {
        
        for character in password{
            if "1234567890".contains(character){
                return true
            }
        }
        
        return false
    }
    
    func checkIfContainsUpper(_ password: String) -> Bool {
        
        for character in password{
            if "ABCDEFGHIGKLMNOPQRSTUVWXYZ".contains(character){
                return true
            }
        }
        
        return false
    }
    
    func checkCharacterCount(_ password: String) -> Bool {
        let passwordLength = password.count
        
        if(passwordLength > 6){
            return true
        }
        
        
        return false
    }
}

