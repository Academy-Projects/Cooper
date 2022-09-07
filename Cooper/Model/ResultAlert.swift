//
//  ResultAlert.swift
//  Cooper
//
//  Created by Matheus Costa on 07/09/22.
//

import Foundation
import SwiftUI

struct CustomAlertView: View{
    @Binding var show : Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            VStack(spacing: 25){
                Image("bone")
                Text("PARABÉNS")
                Text("VOCÊS CONSEGUIRAM ENTENDER O TURISTA")
//                Button(action: {presentationMode.wrappedValue.dismiss()},
//                       label: {
//                        Text("BACK")
//                            .foregroundColor(.white)
//                            .fontWeight(.bold)
//                            .padding(.vertical, 10)
//                            .background(Color.blue)
//                            .clipShape(Capsule())
//                        })
                
                NavigationLink(destination: HistoryView(), label: {
                    Text("OK")
                        .font(Font.custom("SourceSans3-Bold", size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                      //  .padding(EdgeInsets(top: 247, leading: 340, bottom:0 , trailing: 12))
                        .foregroundColor(.white)
                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                        )
                    })
                      .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.063)
                      .padding(.trailing, 34)
                
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .cornerRadius(25)
            .background(.cyan)
            .cornerRadius(20)
            
            Button(action: {
                    show.toggle()
                    },
                   label: {
                    Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.blue)
                
            }).padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

