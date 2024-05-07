//
//  Categories.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 7/5/24.
//

import SwiftUI
import SwiftData

@Model
class Categories {
    var name: String
    var icon: String
    @Relationship(deleteRule:.cascade) var password = [Password]()
    
    init(name: String, icon: String, password: [Password] = [Password]()) {
        self.name = name
        self.icon = icon
        self.password = password
    }
}

