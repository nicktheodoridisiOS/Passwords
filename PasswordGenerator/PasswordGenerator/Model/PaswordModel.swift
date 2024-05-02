//
//  PasswordModel.swift
//  PasswordGenerator
//
//  Created by Nick Theodoridis on 20/5/23.
//

import Foundation
import SwiftUI

struct PaswordModel: Identifiable , Codable{
    var id =  UUID()
    var password : String
    var containsSymbol: Bool
    var containsUppercase: Bool
    
    var colorStrength: Color{
        
        var  strength = 0
        var color: Color
        
        if containsSymbol{
            strength += 1
        }
        
        if containsUppercase{
            strength += 1
        }
        
        if password.count > 12{
            strength += 1
        }
        else if password.count < 8{
            strength -= 1
        }
        
        switch strength{
        case 1: color = .red
        case 2: color = .orange
        case 3: color = .green
        default: color = .gray
        }
        
        return color
    }
}


