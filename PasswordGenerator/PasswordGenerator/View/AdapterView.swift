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
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Password")){
                        TextField("Enter your password", text: $customPasswordTf)
                    }
                    
                    Section(header: Text("Contains")){
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(vm.checkCharacterCount(customPasswordTf) ? .orange : .gray.opacity(0.2), lineWidth:3)
                                    .frame(width: 75, height: 75)
                                    
                                ZStack{
                                    Text("LENGTH")
                                        .foregroundColor(vm.checkCharacterCount(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 9,weight: .bold,design: .rounded))
                                        .offset(y:-33)
                                    Text("6")
                                        .foregroundColor(vm.checkCharacterCount(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 60,design: .rounded))
                                }
                                .offset(y:5)
                            }
    
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(vm.checkIfContainsUpper(customPasswordTf) ? .orange : .gray.opacity(0.2), lineWidth:3)
                                    .frame(width: 75, height: 75)
                                    
                                ZStack{
                                    Text("UPPERCASE")
                                        .foregroundColor(vm.checkIfContainsUpper(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 9,weight: .bold,design: .rounded))
                                        .offset(y:-33)
                                    Text("A")
                                        .foregroundColor(vm.checkIfContainsUpper(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 60,design: .rounded))
                                }
                                .offset(y:5)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(vm.checkIfContainsNumbers(customPasswordTf) ? .orange : .gray.opacity(0.2), lineWidth:3)
                                    .frame(width: 75, height: 75)
                                    
                                ZStack{
                                    Text("NUMBER")
                                        .foregroundColor(vm.checkIfContainsNumbers(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 9,weight: .bold,design: .rounded))
                                        .offset(y:-33)
                                    Text("0")
                                        .foregroundColor(vm.checkIfContainsNumbers(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 60,design: .rounded))
                                }
                                .offset(y:5)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(vm.checkIfContainsSymbol(customPasswordTf) ? .orange : .gray.opacity(0.2), lineWidth:3)
                                    .frame(width: 75, height: 75)
                                    
                                ZStack{
                                    Text("SYMBOL")
                                        .foregroundColor(vm.checkIfContainsSymbol(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 9,weight: .bold,design: .rounded))
                                        .offset(y:-33)
                                    Text("$")
                                        .foregroundColor(vm.checkIfContainsSymbol(customPasswordTf) ? .orange : .gray.opacity(0.2))
                                        .font(.system(size: 60,design: .rounded))
                                }
                                .offset(y:5)
                            }
                        }
                    }
                    
                    Section(header: Text("STRENGTH")){
                        if vm.checkStrength(customPasswordTf) == "Weak" {
                            Text("Weak").foregroundColor(Color.red)
                        }
                        else if vm.checkStrength(customPasswordTf) == "Medium"{
                            Text("Medium").foregroundColor(Color.orange)
                        }
                        else{
                            Text("Strong").foregroundColor(Color.green)
                        }
                    }
                    
                }
                
                
            }.navigationTitle("Adapter")
        }
    }
}

struct AdapterView_Previews: PreviewProvider {
    static var previews: some View {
        AdapterView()
    }
}
