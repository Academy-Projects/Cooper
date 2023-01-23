//
//  ButtonPlay.swift
//  Cooper
//
//  Created by kevin marinho on 23/01/23.
//

import Foundation
import SwiftUI

struct ButtonPlay: View {
    @State var font = FontViewModel()
    var body: some View {
        ZStack{
            NavigationLink(destination: DrawnView(), label: {
                Text("Jogar")
                    .font(Font.custom(font.font.FontSourceSansBold, size: 28))
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.colorFontUnique)
                    .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .background(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                    )
                    .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                })
                  .buttonStyle(FlatLinkStyle())
                  .animation(.easeInOut(duration: 0.3))
                  .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.063)
                  .padding(.trailing, 85)
        }
    }
}
