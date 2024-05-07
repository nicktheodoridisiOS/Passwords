//
//  Password.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 2/5/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Password{
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}


