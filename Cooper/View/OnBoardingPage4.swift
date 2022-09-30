//
//  OnBoardingPage1.swift
//  Cooper
//
//  Created by Matheus Costa on 27/09/22.
//

import Foundation
import SwiftUI
import SpriteKit
    
struct OnBoardingPage4: View{
    var onboardingSteps:[OnboardingStep]
    
    @AppStorage ("isOnboarding") public var  isOnboarding: Bool = true
    @Environment(\.presentationMode) var presentationMode
    
    public var Ascene: SKScene{
        let animationScene = AnimationScene()
        animationScene.index = 3
        animationScene.scaleMode = .fill
        return animationScene
    }
    
    var body: some View{
        
            HStack{
                VStack{
                    HStack{
                        VStack{ // Cena da animação.
                            SpriteView(scene: Ascene, isPaused: false, options: [.allowsTransparency])
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.416, height: UIScreen.main.bounds.height * 0.63, alignment: .leading)
                        .padding(.leading, 90)
                        .padding(.trailing, 40)
                        .padding(.top, 173)
                        Spacer()
                        VStack{
                            Text(onboardingSteps[3].caso)
                                .font(Font.custom("Boogaloo-Regular", size: 55))
                                .minimumScaleFactor(0.1) //<--Here
                                .frame(width: UIScreen.main.bounds.width * 0.37, height: UIScreen.main.bounds.height * 0.13, alignment: .leading)
                                .foregroundColor(Color(red: 0/255, green: 62/255, blue: 89/255))
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 30)
                          //  Spacer()
                            Text(onboardingSteps[3].isntruction)
                                .font(Font.custom("SourceSans3-Regular", size: 20))
                                .minimumScaleFactor(0.1)
                                .frame(width: UIScreen.main.bounds.width * 0.37, height: UIScreen.main.bounds.height * 0.13, alignment: .leading)
                                .foregroundColor(Color("ColorFontTwo"))
                               // .padding(.trailing, 15)
                                .multilineTextAlignment(.leading)
                               // .padding(.bottom, 300)
                        }
                        .padding(.trailing, 80)
                        .padding(.top, 173)
                 
                    }.frame(height: UIScreen.main.bounds.height * 0.68)
                    Spacer()
                    HStack(){
                        // botao com condicao para que verifique se a view ja foi mostrada uma vez no app
                        // a condicao existe para que o usuario possa ver a instrucoes novamente caso  queira
                        // para isso existe um botao que chama a view de onboarding
                        Button(action:{
                            if isOnboarding == true {
                                self.isOnboarding = false
                            }else{
                                // else que faz com que view volta para anterior
                                //condicao so é chamada caso o usuario ja tenha passado pelo tutorial e esteja na tela por opcao propria
                                let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                impactMed.impactOccurred()
                                
                                presentationMode.wrappedValue.dismiss()
                                


                            }
                          } , label: {Text("Pular")})
                            .font(Font.custom("SourceSans3-Regular", size: 22))
                            .foregroundColor(Color("ColorFontTwo"))
                
                        Spacer()
                        
                        HStack{
                                // foreach criado para fazer o page view
                            //funciona contando as etapas atraves do current step
                            ForEach(0..<4){ it in
                                if it == 3{
                                    Rectangle()
                                        .frame(width: 20, height: 10)
                                        .cornerRadius(10)
                                        .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                } else {
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.gray)
                                }
                                
                            }
                        }
                        
                        Spacer()
                        // teste
                        NavigationLink(destination: HistoryView(),
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
                    .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.04)
                    .padding(.bottom, 5)
                    

                }
                .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.89)
                

             }
                
            }
    }