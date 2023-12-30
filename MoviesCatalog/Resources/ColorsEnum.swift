//
//  ColorsEnum
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

enum ColorsEnum {
    
    static let accent2 = Color("Accent_y")
    static let accent = Color("Accent_r")
    static let black = Color("Black")
    static let gray = Color("Gray")
    static let green = Color("Green")
    static let greenLight = Color("GreenLight")
    static let fire = Color("Fire")
    static let orange = Color("Orange")
    static let red = Color("Red")
    static let white = Color("White")
    static let yellow = Color("Yellow")
    
    
    
    static func getGray(with shift: Double) -> Color {
        return  Color.gray.opacity(shift)
    }
    
    
    static func getColor(of color: Color, by shift: Double) -> Color {
        return color.opacity(shift)
    }
    
}

