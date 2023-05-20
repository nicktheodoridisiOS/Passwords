//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    
    var body: some View {
        VStack {
            Form{
                Section("Options"){
                    Toggle("Symbols",isOn: $vm.containsSymbol)
                        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    Toggle("Uppercase",isOn: $vm.containsUppercase)
                        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    Stepper("Character counter: \(vm.length)",value: $vm.length,in: 6...18)
                    Button("Generate Password",action: vm.createPassword)
                        .centerH()
                }
                
                Section("Password"){
                    List{
                        ForEach(vm.passwords){ password in
                            HStack{
                                Text("\(password.password)")
                                    .padding()
                                    .textSelection(.enabled)
                                Spacer()
                                Image(systemName: "lock")
                                    .foregroundColor(password.colorStrength)
                            }
                        }.onDelete(perform: deleteItem)
                    }
                }
            }
            .addNavigationView(title: "Password Generator")
            .accentColor(.accentColor)
        }
        .padding()
    }
    
    func deleteItem(indexSet: IndexSet){
        vm.passwords.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
