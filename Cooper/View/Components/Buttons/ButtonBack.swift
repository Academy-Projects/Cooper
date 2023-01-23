//
//  Components.swift
//  Cooper
//
//  Created by kevin marinho on 19/01/23.
//

import Foundation
import SwiftUI

struct ButtonBack : View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var font = FontViewModel()
    @State var properties = DrawnViewModel()
    var body: some View{
        HStack{
            Button(action: {
                
                let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                impactMed.impactOccurred()
                
                presentationMode.wrappedValue.dismiss()
            },
                   label: {
                Rectangle()
                Image(systemName: "chevron.left")
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
            
        }
    }
}
