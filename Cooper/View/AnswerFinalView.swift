//
//  AnswerFinalView.swift
//  Cooper
//
//  Created by kevin marinho on 23/08/22.
//
import SwiftUI
import SpriteKit

struct AnswerFinalView: View {
    
    var ilustrationScene: GameScene
    var story: ListHistory = naps[indexQuestion]
    @State var cor:Color = Color(red: 0/255, green: 59/255, blue: 75/255)
    
    @State var buttonPressed:Int = 0
    @State var opacityButton:Double = 1
    @State var opacityPlay: Double = 0
    
    @State var presentResultAlert = false // Faz o Pop-Up aparecer ou não
    @State var result = false // Indica se o usuario acertou ou não.
    
    // Cria um tipo de apresentação.
    @Environment(\.presentationMode) var presentationMode
    
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
                            
                            Button(action: {presentationMode.wrappedValue.dismiss()},
                                   label: {
                                    Rectangle()
                                    Image(systemName: "chevron.left")
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .foregroundColor(Color("colorFont"))
                                        .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                        .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .background(RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                        )
                                        .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 3, y: 3)
                                    }).frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                            
                                
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.leading, 14)
                        .padding(.top, 14)

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.height * 0.87)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0))
                    .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                        )
                }
                VStack{
                    Text("O que Cooper está \ntentando comunicar?")
                        .bold()
                        .scaledToFit()
                        .font(Font.custom("SourceSans3-Bold", size: 25))
                        .foregroundColor(Color("colorFont"))
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 25, leading: 0, bottom: 14, trailing: 0))
                    
                    Button(action: {
                                buttonPressed = 1
                                opacityButton = 0.5
                                opacityPlay = 1
                                // Verifica se a resposta escolhida está correta.
                                if answerChoice ==  1{
                                    // Diz para o ResultAlert que a resposta está correta.
                                    result = true
                                }else{
                                    // Diz para o ResultAlert que a resposta está incorreta.
                                    result = false
                                }
                            },
                           label: {
                           
                                if buttonPressed == 1{
                                    Text(story.finalOne)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
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
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                }
                            })
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .padding(.bottom, 8)
            //        Spacer()
                    Button(action: {
                            buttonPressed = 2
                            opacityButton = 0.5
                            opacityPlay = 1
                            // Verifica se a resposta escolhida está correta.
                            if answerChoice ==  2{
                                // Diz para o ResultAlert que a resposta está correta.
                                result = true
                            }else{
                                // Diz para o ResultAlert que a resposta está incorreta.
                                result = false
                            }
                        },
                           label: {
                                if buttonPressed == 2{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                } else{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                }
                            })
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .padding(.bottom, 8)
                   // Spacer()
                    Button(action: {
                            buttonPressed = 3
                            opacityButton = 0.5
                            opacityPlay = 1
                            // Verifica se a resposta escolhida está correta.
                            if answerChoice ==  3{
                                // Diz para o ResultAlert que a resposta está correta.
                                result = true
                            }else{
                                // Diz para o ResultAlert que a resposta está incorreta.
                                result = false
                            }
                        },
                           label: {
                                if buttonPressed == 3{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                } else{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .frame(width: UIScreen.main.bounds.width * 0.22, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                }
                            })
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .padding(.bottom, 8)
                    
                    Button(action:{// Muda a variável para apresentar o Pop-Up.
                            presentResultAlert.toggle()
                            },
                           label: {
                            Text("OK")
                                .foregroundColor(Color("colorFont"))
                                .font(Font.custom("SourceSans3-Bold", size: 25))
                                .frame(width: UIScreen.main.bounds.width * 0.24, height: UIScreen.main.bounds.height * 0.046)
                                .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                )
                                .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                            })
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .padding(.top, 8)
             
                }.frame(width: UIScreen.main.bounds.width * 0.26)
                    .background(Color.white)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 17))
            }
            .frame(width: UIScreen.main.bounds.width * 0.96, height: UIScreen.main.bounds.height * 0.92)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 3)
            //.overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black))
            .background(RoundedRectangle(cornerRadius: 13)
            ).padding()
      
          if self.presentResultAlert {
              CustomAlertView(show: $presentResultAlert, result: result).background(Color.black.opacity(0.3))
          }
          
      }
      .frame(maxWidth: . infinity, maxHeight: .infinity)
      .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustrationWhite"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                   startPoint: .leading,
                                   endPoint: .trailing))
         .navigationBarHidden(true)
    }
}



struct FrameAdjustingContainer<Content: View>: View {
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
    let content: () -> Content
    
    var body: some View  {
        ZStack {
            content()
                .frame(width: frameWidth, height: frameHeight)
                .border(Color.red, width: 1)
            
            VStack {
                Spacer()
                Slider(value: $frameWidth, in: 50...300)
                Slider(value: $frameHeight, in: 50...600)
            }
            .padding()
        }
    }
}
