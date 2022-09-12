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
    
    let gameScene = GameScene()
//chamando cena spritKit
    public var scene: SKScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
    }
    
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    
    @State var imagens:[[String]] = [["círculopic", "estrelapic", "igualpic", "quadradopic", "andandopic","bbpic","bussulapic", "facapic", "folhapic", "homempic", "musicapic", "ônibuspic", "tempopic","nuvempic", "raiopic", "seta", "ursopic"],
        ["autofalantepic","seta", "triangulopic", "maiorpic", "adiçãopic", "bolsapic", "caixãopic", "checkpic", "coraçaopic", "dinheiropic", "Explosao", "fogopic", "gotapic", "maçapic", "ondapic", "refeiçãopic", "sentandopic"]]
    
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
                    
                    
                    
                           // .padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 900))
                }.frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 24)
                .padding(.top, 24)
            }
            .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.90)
            .padding(.trailing, -6)
            .padding(.leading, -6)
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
                        .font(Font.custom("SourceSans3-Bold", size: 20))
                        .foregroundColor(Color("colorFont"))
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 35, leading: 0, bottom: 14, trailing: 0))
            ZStack{
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
                                            .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.07)
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
                
            }
            NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
                    Text("Terminei de ilustrar ")
                        .font(Font.custom("SourceSans3-Bold", size: 20))
                        .foregroundColor(Color("colorFont"))
                        .frame(width: UIScreen.main.bounds.width * 0.23, height: UIScreen.main.bounds.height * 0.046)
                        .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                        )
                        .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                })
                 
                 .padding(EdgeInsets(top: 15, leading: 0, bottom: 32, trailing: 0))
            
        }.frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.93)
            .background(Color.white)
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
