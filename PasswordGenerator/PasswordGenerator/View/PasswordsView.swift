//
//  PasswordsView.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 31/8/23.
//

import SwiftUI

struct PasswordsView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                
            }
            .navigationTitle("Passwords")
            .searchable(text: $searchText)
        }
    }
}

struct PasswordsView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordsView()
    }
}
