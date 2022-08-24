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
    
    var body: some View{
        ZStack{
//            background(Color.gray)
            
            HStack{
                //adiciona um screenshot da Illustration scene
                Image(uiImage: ilustrationScene.takeScreenshot(scene: ilustrationScene))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 700, height: 700, alignment: .center)
                    .border(Color.black, width: 10)
                VStack{
                    Button(action: {ilustrationScene.removeAllChildren()},
                           label: {
                            Text("Option 1")
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 200)
                            .background(Color.blue.cornerRadius(20))
                    })
                    Button(action: {ilustrationScene.removeAllChildren()},
                           label: {
                            Text("Option 2")
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 200)
                            .background(Color.blue.cornerRadius(20))
                    })
                    Button(action: {ilustrationScene.removeAllChildren()},
                           label: {
                            Text("Option 3")
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 200)
                            .background(Color.blue.cornerRadius(20))
                    })
                }
            }
        }.background(.gray)
    }
}
