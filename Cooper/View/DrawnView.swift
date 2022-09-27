// será que essa porra funciona ???
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI
import SpriteKit
import Popovers

struct PopoverContent: View {
    
    
    var body: some View {
        VStack {
            Text(final)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
        }
        .frame(width: 350, height: 200)
    }
}

struct DrawnView: View {
    
    let gameScene = GameScene()
//chamando cena spritKit
    public var scene: SKScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
    }
    var choice: ListHistory = naps[indexQuestion]
    
    @State var timerRemaining = 60
    @State var jump = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showPopover = false
    
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    
    @State var imagens:[[String]] = [["homempic", "sentandopic", "círculopic", "triangulopic", "adiçãopic","seta","checkpic", "retapic", "folhapic", "bussulapic", "ônibuspic", "nuvempic", "ursopic","bolsapic", "coraçaopic", "Explosao", "gotapic"],
        ["andandopic","bbpic", "quadradopic", "estrelapic", "igualpic", "maiorpic", "ondapic", "facapic", "musicapic", "tempopic", "raiopic", "autofalantepic", "caixãopic", "dinheiropic", "fogopic", "maçapic", "refeiçãopic"]]
    
    // Cria um tipo de apresentação.
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View{
ZStack{
    HStack{
        ZStack{
            //chamando a cena spritkit dentro de uma view
                SpriteView(scene: scene, isPaused: false)
            ZStack{
                HStack{
                    // Botão para voltar uma tela.
                    Button(action: {
                        showPopover = true
                        
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
                                Image(systemName: "lightbulb.fill")
                                    .font(Font.custom("SourceSans3-Bold", size: 20))
                                    .foregroundColor(Color("colorFont"))
                                    .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                    .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                    )
                                    .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 3, y: 3)
                            })
                            .buttonStyle(FlatLinkStyle())
                            .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                            .popover(isPresented: $showPopover) {
                                PopoverContent()
                            }
                            
                    
                    
                           // .padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 900))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.leading, 24)
                .padding(.bottom, 13)
                
                HStack{
                    // Botão para voltar uma tela.
                    Text("\(timerRemaining)")
                        .font(Font.custom("SourceSans3-Bold", size: 35))
                        .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                        .onReceive(timer) {_ in
                            if timerRemaining > 0{
                                timerRemaining -= 1
                            } else {
                                jump = true
                                
                                timer.upstream.connect().cancel()
                            }
                        }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.trailing, 24)
                .padding(.top, 13)
                
                HStack{
                    // Botão para voltar uma tela.
                    Button(action: {presentationMode.wrappedValue.dismiss()},
                           label: {
                                Rectangle()
                                Image(systemName: "chevron.left")
                                    .font(Font.custom("SourceSans3-Bold", size: 20))
                                    .foregroundColor(Color("colorFont"))
                                    .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                    .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                    )
                                    .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 3, y: 3)
                            })
                            .buttonStyle(FlatLinkStyle())
                            .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                    
                           // .padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 900))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 24)
                .padding(.top, 13)
                
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.90)
            .padding(.trailing, -6)
            .padding(.leading, -6)
            .padding(.bottom, -3)
            .padding(.top, -3)
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                )
        }
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 3)
            .background(RoundedRectangle(cornerRadius: 13)
            ).padding()
        VStack{
                Text("Clique nos cards que deseja \nusar para ilustrar a história")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("SourceSans3-Bold", size: 23))
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.08)
                        .foregroundColor(Color("colorFont"))
                       // .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                ScrollView{
                   // Spacer()
                    VStack{
                        //array que tras a imagens após serem selecionadas
                        ForEach(0..<(imagens[0].count)){imageidx in
                            HStack{
                                Button(action: {gameScene.createNewObj(image: imagens[0][imageidx])}){
                                    ZStack{
                                        Image("FundoCard")
                                            .resizable()
                                            .scaledToFit()
                                        Image(imagens[0][imageidx])
                                            .frame(width: UIScreen.main.bounds.width * 0.063, height: UIScreen.main.bounds.height * 0.084)
//                                            .resizable()
//                                            .scaledToFit()

                                    }
                                }.frame(width: UIScreen.main.bounds.width / 9)

                                Button(action: {gameScene.createNewObj(image: imagens[1][imageidx])}){
                                    ZStack{
                                        Image("FundoCard")
                                            .resizable()
                                            .scaledToFill()
                                        Image(imagens[1][imageidx])
                                            .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.07)
                                    }
                                
                                }.frame(width: UIScreen.main.bounds.width / 9)
                            }
                          }
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.71)
            NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), isActive: $jump, label: {
                    Text("Terminei de ilustrar ")
                        .font(Font.custom("Boogaloo-Regular", size: 23))
                        .foregroundColor(Color("colorFont"))
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.23, height: UIScreen.main.bounds.height * 0.046)
                        .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                        )
                        .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                })
                 .frame(height: UIScreen.main.bounds.height * 0.040)
                 .buttonStyle(FlatLinkStyle())
                 .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            
        }.frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.93)
            .background(Color("ColorBackgroundInside"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 3)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 17))
           }.background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustrationWhite"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                        startPoint: .leading,
                                        endPoint: .trailing))    }.navigationBarHidden(true)
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
