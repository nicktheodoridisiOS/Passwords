//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import SwiftUI

struct GeneratorView: View {
    
    @StateObject private var vm = PasswordViewModel()
    
    
    var body: some View {
        NavigationStack {
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
                    
                    Section("Generated Passwords"){
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
                            }
                            .onDelete(perform: deleteItem)
                        }
                    }
                }
                .addNavigationView(title: "Generator")
                .accentColor(.accentColor)
            }
        }
        .tint(.orange)
    }
    
    func deleteItem(indexSet: IndexSet){
        vm.passwords.remove(atOffsets: indexSet)
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView()
    }
}
