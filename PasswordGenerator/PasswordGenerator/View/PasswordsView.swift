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
    @Query var categories: [Categories]
    
    @State private var addCategory = false
    @State private var selectedCategory: Categories? = nil
    
    var body: some View {
        NavigationStack{
            VStack{
                if allPasswords.isEmpty {
                    ContentUnavailableView {
                        Label("No Passwords", systemImage: "key.slash")
                    } description: {
                        Text("Your passwords you save will appear here.")
                    }
                } else {
                    List{
                        ForEach(categories, id:\.self) { category in
                            NavigationLink(destination: PasswordList(selectedCategory: $selectedCategory, title: category.name, category: category)) {
                                HStack{
                                    Image(systemName: category.icon)
                                        .foregroundStyle(.blue)
                                        .frame(maxWidth: 30)
                                        .font(.title3)
                                    Text(category.name)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            deleteCategory(at: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Passwords")
            .scrollIndicators(.hidden)
            .sheet(isPresented: $addCategory) {
                AddCategoryView()
            }
            .toolbar{
                if !categories.isEmpty{
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        addButton
                    }
                }
            }
        }
    }
    
    var addButton: some View{
        Button("Add"){
            addCategory.toggle()
        }
    }
    
    func deleteCategory(at indexSet: IndexSet) {
        for index in indexSet {
            context.delete(categories[index])
        }
    }
}
