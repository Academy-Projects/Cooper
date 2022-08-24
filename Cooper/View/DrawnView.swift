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
    
    @State var imagens:[String] = ["X", "Eyes", "Fire", "Done!"]
    
    
    var body: some View{
        ZStack{
         HStack{
            ZStack{
                SpriteView(scene: scene, isPaused: false)
                    .padding(EdgeInsets(top: 4, leading: 14, bottom: 4, trailing: 14))
            }
            VStack{
            Text("Clique nos cards que deseja usar \npara ilustrar a história")
                    .bold()
                    .multilineTextAlignment(.center)
            ScrollView{
                Spacer()
                HStack{
                    ForEach(0..<2){imageidx in
                        Button(action: {gameScene.createNewObj(image: imagens[imageidx])}) {
                            VStack {
                                Image(imagens[imageidx])
                                    .resizable()
                              //  Text("Hello world!")
                            }
                            .padding(.leading)
                            .frame(width: 161, height: 168)
                            //.accentColor(Color(.systemRed))
                            .background(.gray)
                            .cornerRadius(34.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                            )
                        }
                        
                    }
                }
               // Spacer()
                Spacer(minLength: 20)
                HStack{
                    ForEach(2..<4){imageidx in
                        Button(action: {gameScene.createNewObj(image: imagens[imageidx])}) {
                            VStack {
                                Image(imagens[imageidx])
                                 //   .padding(EdgeInsets(top: <#T##CGFloat#>, leading: <#T##CGFloat#>, bottom: <#T##CGFloat#>, trailing: <#T##CGFloat#>))
                              //  Text("Hello world!")
                            }
                            .padding(.leading)
                            .frame(width: 161, height: 168)
                            //.accentColor(Color(.systemRed))
                            .background(.gray)
                            .cornerRadius(34.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                            )
                        }
                        
                    }
                }
            }
                NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
                    Text("Done!")
                    .font(.system(size: 30))
                    .bold()
                    .frame(width: 250, height: 60)
                    .background(Color(red: 255/255, green: 175/255, blue: 178/255))
                                                //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                                                .foregroundColor(Color(red: 45/255, green: 29/255, blue: 66/255))
                                                .cornerRadius(10)
                })
           }
        }.background(.gray)
    }.navigationBarHidden(true)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
