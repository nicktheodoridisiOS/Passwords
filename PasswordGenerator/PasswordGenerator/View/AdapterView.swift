//
//  CustomView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI
import SwiftData

struct AdapterView: View {
    
    @State private var customPasswordTf: String = ""
    @State private var passwordStrength: String = ""
    
    @StateObject private var vm = PasswordViewModel()
    
    @Environment(\.modelContext) var context
    
    @State private var selectedCategoryIndex = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Password")){
                        TextField("Enter your password", text: $customPasswordTf)
                            .onChange(of: customPasswordTf) { oldValue,newValue in
                                let strength = vm.checkStrength(newValue)
                                passwordStrength = strength
                            }
                        
                        let strength = vm.checkStrength(customPasswordTf)
                        
                        if strength == "Weak" {
                            passwordStrengthView(strength: "Weak", color: .red)
                        } else if strength == "Medium" {
                            passwordStrengthView(strength: "Medium", color: .orange)
                        } else if strength == "Strong" {
                            passwordStrengthView(strength: "Strong", color: .green)
                        }
                        
                    }
                    
                    Section(header: Text("Contains")){
                        HStack{
                            Text("At least 6 characters")
                            Spacer()
                            Image(systemName: vm.checkCharacterCount(customPasswordTf) ? "checkmark.circle.fill" : "checkmark.circle")
                                .foregroundStyle(vm.checkCharacterCount(customPasswordTf) ? .green : .secondary)
                        }
                        HStack{
                            Text("At least 1 uppercase letter")
                            Spacer()
                            Image(systemName: vm.checkIfContainsUpper(customPasswordTf) ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundStyle(vm.checkIfContainsUpper(customPasswordTf) ? .green : .secondary)                        }
                        HStack{
                            Text("At least 1 number")
                            Spacer()
                            Image(systemName: vm.checkIfContainsNumbers(customPasswordTf) ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundStyle(vm.checkIfContainsNumbers(customPasswordTf) ? .green : .secondary)                        }
                        HStack{
                            Text("At least 1 symbol")
                            Spacer()
                            Image(systemName: vm.checkIfContainsSymbol(customPasswordTf) ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundStyle(vm.checkIfContainsSymbol(customPasswordTf) ? .green : .secondary)                        }
                    }
                    
                    Button(action: {
                        addToSavedPasswords(password: customPasswordTf, colorStrength: passwordStrength)
                        customPasswordTf = ""
                    }, label: {
                        Text("Add Password").foregroundStyle(customPasswordTf.isEmpty ? .gray.opacity(0.2) : .blue).centerH()
                    })
                    
                }
                
                
            }.navigationTitle("Creator")
        }
    }
    
    func passwordStrengthView(strength: String, color: Color) -> some View {
        HStack {
            Text("Strength")
            Spacer()
            Text(strength).foregroundColor(color)
        }
    }
    
    func addToSavedPasswords(password: String, colorStrength: String) {
        let password = Password(name: password, color: colorStrength)
        context.insert(password)
    }
}





