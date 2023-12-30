//
//  CustomButtonStyle
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI


struct CustomButtonStyle: ButtonStyle {
    let color: Color
    let textColor: Color

    init(color: Color, textColor: Color = .white) {
        self.color = color
        self.textColor = textColor
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
            .frame(width: 360, height: 32)
            .padding(12)
            .background(color)
            .cornerRadius(10)
            .foregroundColor(textColor)
            .bold()
            
    }
}
