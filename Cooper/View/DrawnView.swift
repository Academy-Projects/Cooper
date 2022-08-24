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
    
    @State var imagens:[[String]] = [["guardachuva", "chapeu", "Fire"], ["X", "Eyes", "Done!"]]
    
    
    var body: some View{
        ZStack{
         HStack{
            ZStack{
                SpriteView(scene: scene, isPaused: false)
            }
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            //.overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke()
            )
            .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 0))
             
            VStack{
            Text("Clique nos cards que deseja usar \npara ilustrar a história")
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
            ScrollView{
               // Spacer()
                VStack{
                    ForEach(0..<Int(imagens[0].count)){imageidx in
                        HStack{
                            Button(action: {gameScene.createNewObj(image: imagens[0][imageidx])}){
                                Image(imagens[0][imageidx])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 161, height: 168, alignment: .center)
                                    .background(.gray)
                                    .cornerRadius(35.0)
                                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.black, lineWidth: 2))
                            
                            }
                            Button(action: {gameScene.createNewObj(image: imagens[1][imageidx])}){
                                Image(imagens[1][imageidx])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 161, height: 168, alignment: .center)
                                    .background(.gray)
                                    .cornerRadius(34.0)
                                    .overlay(RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2))
                            
                            }
                        }.padding(EdgeInsets(top: 56, leading: 14.5, bottom: 0, trailing: 9.6))
                    }
                }
            }
               // Spacer()
               // Spacer(minLength: 20)
                NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
                    Text("Done!")
                    .font(.system(size: 30))
                    .bold()
                    .frame(width: 250, height: 60)
                    .background(Color(red: 255/255, green: 175/255, blue: 178/255))
                                                //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                                                .foregroundColor(Color(red: 45/255, green: 29/255, blue: 66/255))
                                                .cornerRadius(10)
                }).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            //.overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black))
            .background(RoundedRectangle(cornerRadius: 50)
                .stroke()
            )
            .padding(EdgeInsets(top: 8, leading: 7, bottom: 8, trailing: 17))
            .shadow(color: .black, radius: 5)
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
