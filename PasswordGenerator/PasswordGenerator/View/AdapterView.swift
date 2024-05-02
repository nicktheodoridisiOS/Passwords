//
//  CustomView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI

struct AdapterView: View {
    
    @State private var customPasswordTf: String = ""
    @State private var passwordStrength: String = ""

    
    @StateObject private var vm = PasswordViewModel()
    
    @Environment(\.modelContext) var context
    var passwordList: [Password] = []
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Password")){
                        TextField("Enter your password", text: $customPasswordTf)
                        if vm.checkStrength(customPasswordTf) == "Weak" {
                            HStack{
                                Text("Strength").foregroundStyle(.gray)
                                Spacer()
                                Text("Weak").foregroundColor(Color.red)
                            }
                        }
                        else if vm.checkStrength(customPasswordTf) == "Medium"{
                            HStack{
                                Text("Strength").foregroundStyle(.gray)
                                Spacer()
                                Text("Medium").foregroundColor(Color.orange)
                            }
                        }
                        else{
                            HStack{
                                Text("Strength").foregroundStyle(.gray)
                                Spacer()
                                Text("Strong").foregroundColor(Color.green)
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
              
                    Button(action: {
                        addToSavedPasswords(password: customPasswordTf, colorStrength: .red)
                        customPasswordTf = ""
                    }, label: {
                        Text("Save Password").foregroundStyle(customPasswordTf.isEmpty ? .gray.opacity(0.2) : .blue).centerH()
                    })
                    
                }
                
                
            }.navigationTitle("Creator")
        }
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

struct AdapterView_Previews: PreviewProvider {
    static var previews: some View {
        AdapterView()
    }
}
