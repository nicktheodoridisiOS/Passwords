//
//  AddCategoryView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 7/5/24.
//

import SwiftUI
import SwiftData

struct AddCategoryView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Query var categories: [Categories]
    
    @State private var categoryName: String = ""
    @State private var categoryIcon: String = ""
    
    var symbols = ["apple.logo", "swift"]
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Name")) {
                    TextField("Category Name", text: $categoryName)
                }
                
                Section(header: Text("Icon")) {
                    Picker("Please choose a color", selection: $categoryIcon) {
                        ForEach(symbols, id: \.self) {
                            Image(systemName: $0)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
            }
            .navigationTitle("New Category")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: closeButton,trailing:addButton)
            .padding()
            .interactiveDismissDisabled()
        }
    }
    
    var closeButton: some View{
        Button("Close"){
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var addButton: some View{
        Button("Add"){
            let category = Categories(name: categoryName, icon: categoryIcon, password: [])
            context.insert(category)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}
