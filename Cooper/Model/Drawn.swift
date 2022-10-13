//
//  Drawn.swift
//  Cooper
//
//  Created by kevin marinho on 12/10/22.
//

import SwiftUI

struct Drawn {
    var timerRemaining:Double
    var jump: Bool
    var showPopover: Bool
    var presentResultAlert: Bool
    var imagens:[[String]]
}


struct PopoverContentDrawn: View {
  @State var font = FontViewModel()

    var body: some View {
        VStack(spacing: 0) {
            Text("Lembre-se")
                .padding(.top, 14)
                .font(Font.custom(font.font.FontBoogaloo, size: 30))
                .foregroundColor(Color("ColorFontTwo"))
            Divider()
                .frame(width: 107, height: 2 , alignment: .center)
                .overlay(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                .padding(.bottom, 15)
               // .padding(.leading, 40)
            
            Text(final)
                .font(Font.custom(font.font.FontSourceSansRegular, size: 20))
                .foregroundColor(Color("ColorFontTwo"))
                .padding(.bottom, 20)
                .padding(.horizontal, 15)
        }
        .frame(width: UIScreen.main.bounds.width * 0.23)
        .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                startPoint: .leading,
                                endPoint: .trailing))
        
    }
}
