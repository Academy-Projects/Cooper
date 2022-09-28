// será que essa porra funciona ???
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI
import SpriteKit


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
    
    @State var timerRemaining:Double = 60
    
    @State var jump = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var currentColor = Color.clear
    var colorCircle: [Color] = [.green]
    var colorCircleTwo: [Color] = [.yellow]
    var colorCircleThree = Color(red: 245/255, green: 119/255, blue: 101/255)
    
    
    var choice: ListHistory = naps[indexQuestion]
    
    @State private var showPopover = false
    
    
    @State var presentResultAlert = false // Faz o Pop-Up aparecer ou não
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    //lista de pictogramas
    @State var imagens:[[String]] = [["homempic", "sentandopic", "círculopic", "triangulopic", "adiçãopic","seta","checkpic", "retapic", "folhapic", "bussulapic", "ônibuspic", "nuvempic", "ursopic","bolsapic", "coraçaopic", "Explosao", "gotapic"],
        ["andandopic","bbpic", "quadradopic", "estrelapic", "igualpic", "maiorpic", "ondapic", "facapic", "musicapic", "tempopic", "raiopic", "autofalantepic", "caixãopic", "dinheiropic", "fogopic", "maçapic", "refeiçãopic"]]
    
    // volta para tele anterior
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View{
ZStack{
    HStack{
        ZStack{
            //chamando a cena spritkit dentro de uma view
                SpriteView(scene: scene, isPaused: false, options: [.allowsTransparency])
            ZStack{
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
                    //funcao utilizada para que a animacao do botao clicado nao seja mostrada
                    //solucao encontrada para nao dar o contraste da sombra ao ser clicado
                            .buttonStyle(FlatLinkStyle())
                            .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                            
                }.frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 24)
                .padding(.top, 24)
                
                
                HStack{
                    // Botão para verificar qual solucao vou escolhida
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
                                Image(systemName: "safari")
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
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.trailing, 24)
                .padding(.top, 13)
                
                HStack{
                    
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.red)
                            .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.03)
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: UIScreen.main.bounds.width * ((0.1 * timerRemaining) / 60), height: UIScreen.main.bounds.height * 0.03, alignment: .leading)
//                            .foregroundColor(Color.clear)
                            .foregroundColor(Color.green)
        //                                .padding(.trailing, 20)
                        
                            HStack{
                                Image(systemName:"clock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    //.frame(width: UIScreen.main.bounds.width * 0.03, height: UIScreen.main.bounds.height * 0.03)

//                                    Text("00:00")
                                Text(String(format: "00: %.0f ", timerRemaining))
                                    .font(Font.custom("SourceSans3-Bold", size: 35))
                                    .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                    .onReceive(timer) {_ in
                                        if timerRemaining > 0{
                                            timerRemaining -= 1
                                        } else {
                                            jump = true

                                            presentResultAlert = true
                                            timer.upstream.connect().cancel()
                                        }
                                    }
                            }.onAppear(perform: delayCircle)
                                .background(Color.clear)
                                .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.03)
                    }
                    
                }
                .background(Color(red: 248/255, green: 248/255, blue: 248/255))
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 20)
                
                
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
                        .font(Font.custom("SourceSans3-Bold", size: 23))
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.22, height: UIScreen.main.bounds.height * 0.08)
                        .foregroundColor(Color("colorFont"))
                ScrollView(showsIndicators: false){
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
            
            
                    Button(action:{// Muda a variável para apresentar o Pop-Up.
                            presentResultAlert.toggle()
                            timer.upstream.connect().cancel()
                    }, label: {
                    Text("Terminei de ilustrar ")
                        .font(Font.custom("SourceSans3-Bold", size: 21))
                        .foregroundColor(Color("colorFont"))
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
            
                    if self.presentResultAlert {
                        FinishIlustration(gameScene: gameScene, showFinish: $presentResultAlert).background(Color.black.opacity(0.3))
                            }

        }.navigationBarHidden(true)
        
  }
    private func delayCircle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.currentColor = self.colorCircle.randomElement()!
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
            self.currentColor = self.colorCircleTwo.randomElement()!
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
