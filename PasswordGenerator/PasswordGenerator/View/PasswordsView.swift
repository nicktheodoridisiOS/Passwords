//
//  PasswordsView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI
import SwiftData

struct PasswordsView: View {
    
    @Environment(\.modelContext) var context
    
    @Query var allPasswords: [Password]
    
    @State private var searchText: String = ""
    
    var filteredPasswords: [Password] {
            if searchText.isEmpty {
                return allPasswords
            } else {
                return allPasswords.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
    var body: some View {
        NavigationStack{
                VStack{
                    if(allPasswords.isEmpty){
                        ContentUnavailableView {
                            Label("No Passwords", systemImage: "key.slash")
                        } description: {
                            Text("Your passwords you save will appear here.")
                        }
                    }
                    else{
                        List{
                            ForEach(filteredPasswords) { password in
                                HStack{
                                    Text(password.name)
                                    Spacer()
                                    Image(systemName: "lock.fill")
                                        .foregroundStyle(stringToColor(color: password.color))

                                }
                                .padding()
                            }
                            .onDelete(perform: delete)
                        }
                        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Password")
                    }
                }.navigationTitle("Passwords")
        }
        
        
    }
    
    func delete(_ indexSet: IndexSet){
        for index in indexSet{
            let password = allPasswords[index]
            context.delete(password)
        }
    }
    
    func stringToColor(color: String) -> Color{
        switch color{
        case "Weak": return .red
        case "Medium": return .orange
        case "Strong": return .green
        default: return .gray
        }
    }
}
