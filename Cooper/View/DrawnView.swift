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

    public var scene: SKScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
    }
    
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    
    @State var imagens:[[String]] = [["altofalante", "bandeira", "bone"], ["chat", "sombrinha", "presente"]]
    
    
    var body: some View{
        ZStack{
         HStack{
            ZStack{
                SpriteView(scene: scene, isPaused: false)
//                HStack{
//                    NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
//                        Text("Sair")
//                        .font(.system(size: 18))
//                        .bold()
//                        .frame(width: 76, height: 34)
//                        .background(Color.gray.opacity(0.2))
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .background(RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
//                        )
//                    })
//
//                }
            }
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            //.overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke()   
            ).padding(EdgeInsets(top: 0, leading: 14, bottom: 8, trailing: 10))
                VStack{
                        Text("Clique nos cards que deseja usar \npara ilustrar a história")
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                        ScrollView{
                           // Spacer()
                            VStack{
                                ForEach(0..<(imagens[0].count)){imageidx in
                                    HStack{
                                        Button(action: {gameScene.createNewObj(image: imagens[0][imageidx])}){
                                            Image(imagens[0][imageidx])
                                                .resizable()
                                                .scaledToFit()
                                                .background(.gray)
                                                .cornerRadius(35.0)
                                                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.black, lineWidth: 2))
                                        
                                        }.frame(width: UIScreen.main.bounds.width / 9)
                                      //  Spacer()
                                        Button(action: {gameScene.createNewObj(image: imagens[1][imageidx])}){
                                            Image(imagens[1][imageidx])
                                                .resizable()
                                                .scaledToFit()
                                                .background(.gray)
                                                .cornerRadius(34.0)
                                                .overlay(RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2))
                                        
                                        }.frame(width: UIScreen.main.bounds.width / 9)
                                    }
                                  }
                            }
                        }
                        NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
                            Text("Terminei de ilustrar ")
                                .font(.system(size: 20))
                                .bold()
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 24)
                                .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .background(Color.cyan.opacity(12.2))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .background(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.cyan.opacity(12.2), lineWidth: 1)
                            )
                        }).padding()
                    
                     }.frame(width: UIScreen.main.bounds.width / 4)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .background(RoundedRectangle(cornerRadius: 50)
                    .stroke())
                    .shadow(color: .black, radius: 5)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 17))
         }.background(.cyan)

    }.navigationBarHidden(true)
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
