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
//    @State var idDragging = false
    
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    
    var scene: SKScene{
        let scene = GameScene()
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View{
        HStack{
            ZStack{
                SpriteView(scene: scene)
            }
            VStack{
                Button("CLICK-ME"){
                }
                .padding(20)
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
                
                Button("CLICK-ME"){
                }
                .padding(20)
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
                
                Button("CLICK-ME"){
                }
                .padding(20)
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
                Button("CLICK-ME"){
                }
                .padding(20)
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
            }
        }.background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
