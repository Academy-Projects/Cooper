//
//  OnBoardingView.swift
//  Cooper
//
//  Created by kevin marinho on 06/09/22.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("blocked")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.49)
                    .padding(.bottom, 24)
                    .padding(.top, 64)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                    .frame(width: UIScreen.main.bounds.width * 0.49)
                    .foregroundColor(Color("colorFont"))
                    //.padding(.bottom, 20)
                    .font(Font.custom("SourceSans3-Bold", size: 23))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack(spacing: 0){
                    Button(action:{} , label: {Text("Pular")})
                        .font(Font.custom("SourceSans3-Regular", size: 22))
                        .foregroundColor(Color("colorFont"))
                    
                     //   .frame(width: UIScreen.main.bounds.width * 0.08)
            
                    Spacer()
                    Button(action:{} , label: {Text("...")})
                        // .frame(width: UIScreen.main.bounds.width * 0.08)
                    Spacer()
                    Button(action:{} ,
                           label:{
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 6)
                            .font(Font.custom("SourceSans3-Regular", size: 10))
                            .foregroundColor(Color("colorFont"))
                            .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                            .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .background(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 1)
                            )
                        
                    })
                      //  .frame(width: UIScreen.main.bounds.width * 0.08)
                        
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 15)

                
            }
            .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.89)
            .padding()
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                )
        }.navigationBarHidden(true)
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
