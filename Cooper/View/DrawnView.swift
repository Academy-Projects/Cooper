// será que essa porra funciona ???
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI
import SpriteKit

struct DrawnView: View {
    
//CALL SPRITEKIT SCENE
    let gameScene = GameScene()
    public var scene: GameScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
    }
    
    var choice: ListHistory = naps[indexQuestion]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    @State var currentColor = Color(red: 166/255, green: 193/255, blue: 1/255)
    var colorCircle = Color(red: 254/255, green: 179/255, blue: 18/255)
    var colorCircleTwo = Color(red: 245/255, green: 119/255, blue: 101/255)
    var colorCircleThree = Color(red: 245/255, green: 119/255, blue: 101/255)
    
    @State var properties = DrawnViewModel()
    @State var font = FontViewModel()
    // volta para tele anterior
    @Environment(\.presentationMode) var presentationMode

 //MARK: - VIEW BEGIN
    var body: some View{
ZStack{
    HStack{
        ZStack{
            //chamando a cena spritkit dentro de uma view
                SpriteView(scene: scene, isPaused: false, options: [.allowsTransparency])
            ZStack{
                HStack{
                    // Botão para voltar uma tela.
                    ButtonBack()
                            .buttonStyle(FlatLinkStyle())
                            .frame(width: UIScreen.main.bounds.width * 0.029, height: UIScreen.main.bounds.height * 0.038)
                            
                }.frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 25)
                .padding(.top, 18)
                
                
                HStack{
                    // Botão para verificar qual solucao vou escolhida
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
                    
                  //  Button(action: {}, label: {}).onAppear()
                            
                    
                    
                           // .padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 900))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.trailing, 25)
                .padding(.top, 18)
                
                HStack{
                    
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(red: 1/255, green: 97/255, blue: 138/255, opacity: 0.1))
                        //    .foregroundColor(Color.green)
                            .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.04)
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: UIScreen.main.bounds.width * ((0.10 * properties.propertiesDrawn.timerRemaining) / 60), height: UIScreen.main.bounds.height * 0.04, alignment: .leading)
                            .foregroundColor(currentColor)
                       //     .onAppear(perform: delayCircle)

                        
                            HStack{
                                Image(systemName:"clock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("ColorBackBotton"))
                                Spacer()
                                Text(String(format: "00: %.0f ", properties.propertiesDrawn.timerRemaining))
                                    .foregroundColor(Color("ColorBackBotton"))
                                    .font(Font.custom(font.font.FontBoogaloo, size: 35))
                                    .minimumScaleFactor(0.1) //<--Here
                                    .frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.height * 0.04)
                                    .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                    .padding(.trailing, 5)
                                // MARK: TIMER AQUI GALERA!
//                                    .onReceive(timer) {_ in
//                                        if properties.propertiesDrawn.timerRemaining > 0{
//                                            properties.propertiesDrawn.timerRemaining -= 1
//                                        } else {
//                                            properties.propertiesDrawn.jump = true
//
//                                            properties.propertiesDrawn.presentResultAlert = true
//                                            timer.upstream.connect().cancel()
//                                        }
//                                    }
                            }
                            .background(Color.clear)
                            .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.04)
                    }
                    
                }
                .background(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 18)
                
                
            }
            
            
            .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.90)
            .padding(.trailing, -3)
            .padding(.leading, -3)
            .padding(.bottom, -1)
            .padding(.top, -1)
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                )
        }
            .background(Color("ColorBackgroundInside"))
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 3)
            .background(RoundedRectangle(cornerRadius: 13))
            .frame(height: UIScreen.main.bounds.height * 0.93)
            .padding(.trailing, 15)
            .padding(.leading, 15)
        
        VStack{
                Text("Clique nos cards que deseja \nusar para ilustrar a história")
                        .multilineTextAlignment(.center)
                        .font(Font.custom(font.font.FontSourceSansBold, size: 23))
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.08)
                        .foregroundColor(Color.colorFontUnique)
                ScrollView(showsIndicators: false){
                   // Spacer()
                    VStack{
                        //array que tras a imagens após serem selecionadas
                        ForEach(0..<(properties.propertiesDrawn.imagens[0].count)){imageidx in
                            HStack{
                                Button(action: {scene.createNewObj(image: properties.propertiesDrawn.imagens[0][imageidx])}){
                                    ZStack{
                                        Image("FundoCard")
                                            .resizable()
                                            .scaledToFit()
                                        Image(properties.propertiesDrawn.imagens[0][imageidx])
                                            .frame(width: UIScreen.main.bounds.width * 0.063, height: UIScreen.main.bounds.height * 0.084)

                                    }
                                }.frame(width: UIScreen.main.bounds.width / 9)

                                Button(action: {scene.createNewObj(image: properties.propertiesDrawn.imagens[1][imageidx])}){
                                    ZStack{
                                        Image("FundoCard")
                                            .resizable()
                                            .scaledToFill()
                                        Image(properties.propertiesDrawn.imagens[1][imageidx])
                                            .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.07)
                                    }
                                
                                }.frame(width: UIScreen.main.bounds.width / 9)
                            }
                          }
                    }
                    
                }.frame(height: UIScreen.main.bounds.height * 0.71)
            
            
                    Button(action:{// Muda a variável para apresentar o Pop-Up.
                            properties.propertiesDrawn.presentResultAlert.toggle()
                            timer.upstream.connect().cancel()
                    }, label: {
                    Text("Terminei de ilustrar ")
                            .font(Font.custom(font.font.FontSourceSansBold, size: 21))
                            .foregroundColor(Color.colorFontUnique)
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.23, height: UIScreen.main.bounds.height * 0.046)
                        .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .background(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                        )
                        .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                        //
                    })
            //funcao utilizada para que a animacao do botao clicado nao seja mostrada
            //solucao encontrada para nao dar o contraste da sombra ao ser clicado
                 .frame(height: UIScreen.main.bounds.height * 0.040)
                 .buttonStyle(FlatLinkStyle())
                 .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                 
            
        }.frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.93)
            .background(Color("ColorBackgroundInside"))
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 3)
            .background(RoundedRectangle(cornerRadius: 13))
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 17))
            
        
        
          
           }
    
    
            .frame(maxWidth: . infinity, maxHeight: .infinity)
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustrationWhite"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
            
            if self.properties.propertiesDrawn.presentResultAlert {
                FinishIlustration(gameScene: gameScene, showFinish: $properties.propertiesDrawn.presentResultAlert).background(Color.black.opacity(0.3))
                            }

        }.navigationBarHidden(true)
        
  }
//    private func delayCircle() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 41) {
//            self.currentColor = self.colorCircleTwo
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
//            self.currentColor = self.colorCircle
//        }
//    }
}



