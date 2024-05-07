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
    
    @Query var categories: [Categories]
    @State private var selectedCategoryIndex = 0
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Password")){
                        TextField("Enter your password", text: $customPasswordTf)
                        if vm.checkStrength(customPasswordTf) == "Weak" {
                            HStack{
                                Text("Strength")
                                Spacer()
                                Text("Weak").foregroundColor(Color.red)
                            }
                        }
                        else if vm.checkStrength(customPasswordTf) == "Medium"{
                            HStack{
                                Text("Strength")
                                Spacer()
                                Text("Medium").foregroundColor(Color.orange)
                            }
                        }
                        else{
                            HStack{
                                Text("Strength")
                                Spacer()
                                Text("Strong").foregroundColor(Color.green)
                            }
                        }
                        
                    }
                    
                    if !categories.isEmpty{
                        Section(header: Text("Category")) {
                            Picker("Select Category", selection: $selectedCategoryIndex) {
                                ForEach(0..<categories.count, id: \.self) { index in
                                    Text(categories[index].name).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    Button(action: {
                        addToSavedPasswords(password: customPasswordTf, colorStrength: passwordStrength)
                        customPasswordTf = ""
                    }, label: {
                        Text("Save Password").foregroundStyle(customPasswordTf.isEmpty ? .gray.opacity(0.2) : .blue).centerH()
                    })
                    
                }
                
                
            }.navigationTitle("Creator")
        }
    }
    
    func addToSavedPasswords(password: String, colorStrength: String) {
        let newPassword = Password(name: password, color: passwordStrength)
        
        context.insert(newPassword)
        
        if categories.isEmpty {
            let category = Categories(name: "All Passwords", icon: "tray.2", password: [newPassword])
            context.insert(category)
        } else {
            let selectedCategory = categories[selectedCategoryIndex]
            selectedCategory.password.append(newPassword)
            context.insert(selectedCategory)
        }
    }

}




//                    Section(header: Text("Contains")){
//                        VStack(alignment:.leading){
//                            Text("At least 6 characters")
//                                .foregroundColor(vm.checkCharacterCount(customPasswordTf) ? .blue : .gray.opacity(0.2))
//                            Text("At least 1 uppercase letter")
//                                .foregroundColor(vm.checkIfContainsUpper(customPasswordTf) ? .blue : .gray.opacity(0.2))
//                            Text("At least 1 number")
//                                .foregroundColor(vm.checkIfContainsNumbers(customPasswordTf) ? .blue : .gray.opacity(0.2))
//                            Text("At least 1 symbol")
//                                .foregroundColor(vm.checkIfContainsSymbol(customPasswordTf) ? .blue : .gray.opacity(0.2))
//                        }
//                    }
