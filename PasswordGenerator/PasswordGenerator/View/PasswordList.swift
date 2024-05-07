//
//  PasswordList.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 7/5/24.
//

import SwiftUI
import SwiftData

struct PasswordList: View {
    
    @Binding var selectedCategory: Categories?
    
    @Environment(\.modelContext) var context
    
    @Query var allPasswords: [Password]
    
    @State private var searchText: String = ""
    
    let title: String
    let category: Categories
    
    var body: some View {
        VStack{
            if(category.password.isEmpty){
                ContentUnavailableView {
                    Label("No Passwords", systemImage: "key.slash")
                } description: {
                    Text("Your passwords you save will appear here.")
                }
            }
            else{
                List{
                    ForEach(selectedCategory?.password ?? []) { password in
                        HStack{
                            Text(password.name)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(stringToColor(string: password.color)))

                        }
                    }
                    .onDelete(perform: delete)
                }
            }
        }
        .navigationTitle(title)
        .onAppear {
            selectedCategory = category
        }
        
        
    }
    
    func delete(_ indexSet: IndexSet){
        for index in indexSet{
            let password = allPasswords[index]
            context.delete(password)
        }
    }

    func stringToColor(string: String) -> Color {
        switch string {
        case "#FF0000": return .red
        case "#FFA500": return .orange
        case "#00FF00": return .green
        case "#808080": return .gray
        default: return .gray
        }
    }


}

