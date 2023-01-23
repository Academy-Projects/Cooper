//
//  AnswerFinalView.swift
//  Cooper
//
//  Created by kevin marinho on 23/08/22.
//
import SwiftUI
import SpriteKit
//
struct AnswerFinalView: View {
    
    @State var properties = AnswerFinalModelView()
    @State var fonte = FontViewModel()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var currentColor = Color(red: 166/255, green: 193/255, blue: 1/255)
    var colorCircle = Color(red: 254/255, green: 179/255, blue: 18/255)
    var colorCircleTwo = Color(red: 245/255, green: 119/255, blue: 101/255)
    var colorCircleThree = Color(red: 245/255, green: 119/255, blue: 101/255)
    var ilustrationScene: GameScene
    var story: ListHistory = naps[indexQuestion]
    @State var cor:Color = Color("ColorBackBotton")
    
    var body: some View{
      ZStack{
            HStack{
                ZStack{
                    //adiciona um screenshot da Illustration scene
                    Image(uiImage: ilustrationScene.takeScreenshot(scene: ilustrationScene))
                        .resizable()
                        .scaledToFit()
                    ZStack{
                        HStack{
                            ButtonPremisePopOver()
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.trailing, 14)
                        .padding(.top, 4)

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.height * 0.87)
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                    .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                        )
                }
                .background(Color("ColorBackgroundInside"))
                .padding(.leading, 20)
                //////////////////////////////// É AQUI//////////////////////
                
                VStack(spacing: 0){
                    
                    HStack{
                        
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color(red: 1/255, green: 97/255, blue: 138/255, opacity: 0.1))
                            //    .foregroundColor(Color.green)
                                .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.04)
                            
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: UIScreen.main.bounds.width * ((0.10 * properties.AnswerProp.timerRemaining) / 30), height: UIScreen.main.bounds.height * 0.04, alignment: .leading)
                                .foregroundColor(currentColor)
                                .onAppear(perform: delayCircle)

                            
                                HStack{
                                    Image(systemName:"clock")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color("ColorBackBotton"))
                                    Spacer()
                                    Text(String(format: "00: %.0f ", properties.AnswerProp.timerRemaining))
                                        .foregroundColor(Color("ColorBackBotton"))
                                        .font(Font.custom(fonte.font.FontBoogaloo, size: 35))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.height * 0.04)
                                        .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                        .padding(.trailing, 5)
                                        .onReceive(timer) {_ in
                                            if properties.AnswerProp.timerRemaining > 0{
                                                properties.AnswerProp.timerRemaining -= 1
                                            } else {
                                                properties.AnswerProp.jump = true

                                                properties.AnswerProp.presentResultAlert = true
                                                timer.upstream.connect().cancel()
                                            }
                                        }
                                }
                                .background(Color.clear)
                                .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.04)
                        }
                        
                    }
                    .background(Color.clear)
                    .padding(.top, 30)
                    Spacer()
                    VStack{
                        Text("O que Cooper está \ntentando comunicar?")
                            .bold()
                            .scaledToFit()
                            .font(Font.custom(fonte.font.FontSourceSansBold, size: 25))
                            .foregroundColor(Color.colorFontUnique)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 25, leading: 0, bottom: 14, trailing: 0))
                        
                        Button(action: {
                                    properties.AnswerProp.buttonPressed = 1
                                    properties.AnswerProp.opacityButton = 0.5
                                    properties.AnswerProp.opacityPlay = 1
                                    // Verifica se a resposta escolhida está correta.
                                    if answerChoice ==  1{
                                        // Diz para o ResultAlert que a resposta está correta.
                                        properties.AnswerProp.result = true
                                    }else{
                                        // Diz para o ResultAlert que a resposta está incorreta.
                                        properties.AnswerProp.result = false
                                    }
                                },
                               label: {
                               
                                if properties.AnswerProp.buttonPressed == 1{
                                        Text(story.finalOne)
                                        .font(Font.custom(fonte.font.FontSourceSansRegular, size: 25))
                                            .minimumScaleFactor(0.1) //<--Here
                                            .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.07, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(cor)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                            )
                                        
                                    } else{
                                        Text(story.finalOne)
                                            .font(Font.custom(fonte.font.FontSourceSansRegular, size: 25))
                                            .minimumScaleFactor(0.1) //<--Here
                                            .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.07, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(cor)
                                            .opacity(properties.AnswerProp.opacityButton)
                                            .animation(.easeInOut(duration: 0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                            )
                                    }
                                })
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                     //               .padding(.bottom, 8)
                //        Spacer()
                        Button(action: {
                                properties.AnswerProp.buttonPressed = 2
                                properties.AnswerProp.opacityButton = 0.5
                                properties.AnswerProp.opacityPlay = 1
                                // Verifica se a resposta escolhida está correta.
                                if answerChoice ==  2{
                                    // Diz para o ResultAlert que a resposta está correta.
                                    properties.AnswerProp.result = true
                                }else{
                                    // Diz para o ResultAlert que a resposta está incorreta.
                                    properties.AnswerProp.result = false
                                }
                            },
                               label: {
                                    if properties.AnswerProp.buttonPressed == 2{
                                        Text(story.finalTwo)
                                            .font(Font.custom(fonte.font.FontSourceSansRegular, size: 25))
                                            .minimumScaleFactor(0.1) //<--Here
                                            .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.07, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(cor)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                            )
                                    } else{
                                        Text(story.finalTwo)
                                            .font(Font.custom(fonte.font.FontSourceSansRegular, size: 25))
                                            .minimumScaleFactor(0.1) //<--Here
                                            .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.07, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(cor)
                                            .opacity(properties.AnswerProp.opacityButton)
                                            .animation(.easeInOut(duration: 0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                            )
                                    }
                                })
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                            //        .padding(.bottom, 8)
                       // Spacer()
                        Button(action: {
                                properties.AnswerProp.buttonPressed = 3
                                properties.AnswerProp.opacityButton = 0.5
                                properties.AnswerProp.opacityPlay = 1
                                // Verifica se a resposta escolhida está correta.
                                if answerChoice ==  3{
                                    // Diz para o ResultAlert que a resposta está correta.
                                    properties.AnswerProp.result = true
                                }else{
                                    // Diz para o ResultAlert que a resposta está incorreta.
                                    properties.AnswerProp.result = false
                                }
                            },
                               label: {
                                    if properties.AnswerProp.buttonPressed == 3{
                                        Text(story.finalThree)
                                            .font(Font.custom(fonte.font.FontSourceSansRegular, size: 25))
                                            .minimumScaleFactor(0.1) //<--Here
                                            .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.07, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(cor)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                            )
                                    } else{
                                        Text(story.finalThree)
                                            .font(Font.custom(fonte.font.FontSourceSansRegular, size: 25))
                                            .minimumScaleFactor(0.1) //<--Here
                                            .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.07, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(cor)
                                            .opacity(properties.AnswerProp.opacityButton)
                                            .animation(.easeInOut(duration: 0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .background(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                            )
                                    }
                                })
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                               //     .padding(.bottom, 8)
                        
                        Button(action:{// Muda a variável para apresentar o Pop-Up.
                            if properties.AnswerProp.buttonPressed == 0{
                                
                            }else{
                                properties.AnswerProp.presentResultAlert.toggle()
                                timer.upstream.connect().cancel()
                            }
                                },
                               label: {
                                Text("OK")
                                    .foregroundColor(Color.colorFontUnique)
                                    .font(Font.custom(fonte.font.FontSourceSansBold, size: 25))
                                    .frame(width: UIScreen.main.bounds.width * 0.24, height: UIScreen.main.bounds.height * 0.046)
                                    .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                    )
                                    .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                                })
                                .buttonStyle(FlatLinkStyle())
                              //  .frame(width: UIScreen.main.bounds.width * 0.8)
                                .padding(.top, 10)
                 
                    }
                   .frame(width: UIScreen.main.bounds.width * 0.26)//, height: UIScreen.main.bounds.height * 0.60)
//                    .frame(maxWidth: .infinity,alignment: .center)
                    .background(Color("ColorBackgroundInside"))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 200, trailing: 17))
                }
                .frame(maxWidth: .infinity, alignment: .top)
//                .frame(maxHeight: .infinity, alignment: .center)

              //  .padding(.bottom, 250)
                    
            }
            .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.92)
            .background(Color("ColorBackgroundInside"))
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 3)
            //.overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black))
            .background(RoundedRectangle(cornerRadius: 13)
            ).padding()
      
          if self.properties.AnswerProp.presentResultAlert {
              CustomAlertView(show: $properties.AnswerProp.presentResultAlert, result: $properties.AnswerProp.result.wrappedValue).background(Color.black.opacity(0.3))
          }
          
      }
      .frame(maxWidth: . infinity, maxHeight: .infinity)
      .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustrationWhite"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                   startPoint: .leading,
                                   endPoint: .trailing))
         .navigationBarHidden(true)
    }
    private func delayCircle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            self.currentColor = self.colorCircleTwo
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.currentColor = self.colorCircle
        }
    }
}
