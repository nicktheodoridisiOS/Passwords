//
//  PasswordsView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI
import SwiftData

struct PasswordsView: View {
    
    @State private var searchText: String = ""
    @Environment(\.modelContext) var context
    
    @Query var allPasswords: [Password]
    
    var filteredPasswords: [Password] {
        if searchText.isEmpty {
            return allPasswords
        } else {
            return allPasswords.filter { password in
                password.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationStack{
            VStack{
                if allPasswords.isEmpty{
                    ContentUnavailableView {
                        Label("No Passwords", systemImage: "key.slash")
                    } description: {
                        Text("Your passwords you save will appear here.")
                    }
                }
                else{
                    List {
                        ForEach(filteredPasswords) { password in
                            HStack{
                                Text(password.name)
                                Spacer()
                                Text(password.color ?? "")
                            }.padding()
                        }
                        .onDelete { indexSet in
                            deletePasswords(at: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Passwords")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Passwords")
            .scrollIndicators(.hidden)
            
        }
    }

    func deletePasswords(at indexSet: IndexSet) {
        for index in indexSet {
            context.delete(filteredPasswords[index])
        }
    }
}

struct PasswordsView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordsView()
    }
}
