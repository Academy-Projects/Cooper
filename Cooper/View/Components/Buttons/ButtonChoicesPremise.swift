//
//  ButtonChoicesPremise.swift
//  Cooper
//
//  Created by kevin marinho on 23/01/23.
//

import Foundation
import SwiftUI

struct buttonChoicePremise: View{
    
    var story: ListHistory = naps[0]
    @EnvironmentObject var button: PremiseModelView
    @State var font = FontViewModel()
    
    var body: some View{
            VStack{
            Button(action: {
                        button.premiseInfo.buttonPressed = 1
                        button.premiseInfo.opacityButton = 0.5
                        button.premiseInfo.opacityPlay = 1
                        answerChoice = 1 // Armazena 1 se a primeiro botão for pressionado
                    },
                   label: {
                   
                if button.premiseInfo.buttonPressed == 1{
                            Text(story.finalOne)
                                //.font(.system(size: 55))
                                .font(Font.custom(font.font.FontSourceSansRegular, size: 23))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.cor)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                )
                            
                        } else{
                            Text(story.finalOne)
                               // .font(.system(size: 55))
                                .font(Font.custom(font.font.FontSourceSansRegular, size: 23))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.cor)
                                .opacity(button.premiseInfo.opacityButton)
                                .animation(.easeInOut(duration: 0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                )
                        }
                    })
                        .frame(width: UIScreen.main.bounds.width * 0.35)
                       // .padding(.bottom, 8)
    //        Spacer()
            Button(action: {
                    
                    button.premiseInfo.buttonPressed = 2
                    button.premiseInfo.opacityButton = 0.5
                    button.premiseInfo.opacityPlay = 1
                    answerChoice = 2 // Armazena 2 se a segundo botão for pressionado
                    },
                   label: {
                if button.premiseInfo.buttonPressed == 2{
                            Text(story.finalTwo)
                                .font(Font.custom(font.font.FontSourceSansRegular, size: 23))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.cor)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                )
                        } else{
                            Text(story.finalTwo)
                                .font(Font.custom(font.font.FontSourceSansRegular, size: 23))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.cor)
                                .opacity(button.premiseInfo.opacityButton)
                                .animation(.easeInOut(duration: 0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                )
                        }
                    })
                        .frame(width: UIScreen.main.bounds.width * 0.35)
            Button(action: {
                    
                    button.premiseInfo.buttonPressed = 3
                    button.premiseInfo.opacityButton = 0.5
                    button.premiseInfo.opacityPlay = 1
                    answerChoice = 3 // Armazena 3 se a terceiro botão for pressionado
                    },
                   label: {
                        if button.premiseInfo.buttonPressed == 3{
                            Text(story.finalThree)
                                .font(Font.custom(font.font.FontSourceSansRegular, size: 23))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.cor)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                )
                        } else{
                            Text(story.finalThree)
                                .font(Font.custom(font.font.FontSourceSansRegular, size: 23))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.cor)
                                .opacity(button.premiseInfo.opacityButton)
                                .animation(.easeInOut(duration: 0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                )
                        }
                    })
                        .frame(width: UIScreen.main.bounds.width * 0.35)
            }
    }
}
