//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import SwiftUI
import SwiftData

struct GeneratorView: View {
    
    @StateObject private var vm = PasswordViewModel()
    
    @Environment(\.modelContext) var context
    var passwordList: [Password] = []
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Form{
                    Section("Preferences"){
                        Toggle("Symbols",isOn: $vm.containsSymbol)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        Toggle("Uppercase",isOn: $vm.containsUppercase)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        Stepper("Character counter: \(vm.length)",value: $vm.length,in: 6...18)
                    }
                    
                    Button("Generate Password",action: vm.createPassword)
                        .foregroundColor(.blue).centerH()
                    
                    if !vm.passwords.isEmpty{
                        Section("Generated Passwords") {
                            List {
                                ForEach(vm.passwords.indices, id: \.self) { index in
                                    let password = vm.passwords[index]
                                    HStack {
                                        Text("\(password.password)")
                                            .padding()
                                            .textSelection(.enabled)
                                        Spacer()
                                        Image(systemName: "lock")
                                            .foregroundColor(password.colorStrength)
                                    }
                                    .swipeActions(allowsFullSwipe: false) {
                                        Button(role: .destructive) {
                                            deleteItem(indexSet: IndexSet(integer: index))
                                        } label: {
                                            Label("Delete", systemImage: "trash.fill")
                                        }
                                        .tint(.red)
                                        
                                        Button {
                                            addToSavedPasswords(password: password.password, colorStrength: password.colorStrength)
                                        } label: {
                                            Label("Add", systemImage: "plus")
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }
                .addNavigationView(title: "Generator")
                .accentColor(.accentColor)
                .scrollIndicators(.hidden)
            }
        }
        .tint(.blue)
    }
    
    
    func deleteItem(indexSet: IndexSet){
        vm.passwords.remove(atOffsets: indexSet)
    }
    
    func addToSavedPasswords(password: String, colorStrength: Color) {
        let colorString = colorToString(color: colorStrength)
        let password = Password(name: password, color: colorString)
        context.insert(password)
    }
    
    func colorToString(color: Color) -> String {
        switch color {
        case .red: return "#FF0000"
        case .orange: return "#00FF00"
        case .green: return "#00FF00"
        default: return "#FFFFFF" //gray
        }
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView()
    }
}
