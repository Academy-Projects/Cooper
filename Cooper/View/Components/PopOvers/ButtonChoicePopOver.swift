//
//  ButtonChoicePopOver.swift
//  Cooper
//
//  Created by kevin marinho on 20/01/23.
//

import Foundation
import SwiftUI

struct ButtonPopOverChoice: View {
    
    @State var font = FontViewModel()
    var choice: ListHistory = naps[indexQuestion]
    @State var properties = DrawnViewModel()
    
    var body: some View{
        ZStack{
            Button(action: {
                properties.propertiesDrawn.showPopover = true
                
                if answerChoice == 1 {
                    final = choice.finalOne
                }else if answerChoice == 2 {
                    final = choice.finalTwo
                }else {
                    final = choice.finalThree
                }
                
            },
                   label: {
                        Rectangle()
                        Image(systemName: "safari")
                            .font(Font.custom(font.font.FontSourceSansBold, size: 20))
                            .foregroundColor(Color.colorFontUnique)
                            .frame(width: UIScreen.main.bounds.width * 0.029, height: UIScreen.main.bounds.height * 0.038)
                            .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                            )
                            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 3, y: 3)
                    })
                        .buttonStyle(FlatLinkStyle())
                        .frame(width: UIScreen.main.bounds.width * 0.029, height: UIScreen.main.bounds.height * 0.038)
                        .popover(isPresented: $properties.propertiesDrawn.showPopover) {
                            PopoverContentDrawn()
                        }
        }
    }
}