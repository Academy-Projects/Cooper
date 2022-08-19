// será que essa porra funciona ???
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI
import SpriteKit

public var gameImages = ["Eyes", "X"]

struct DrawnView: View {
//    @State var idDragging = false
    
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    
    let gameScene = GameScene()
    
    var scene: SKScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
    }
    
    var body: some View{
        ZStack{
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
