// será que essa porra funciona ???
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI

struct DrawnView: View {
//    @State var idDragging = false
    
    @State var positions : [CGPoint] = [
        CGPoint(x: 100, y: 100),
        CGPoint(x: 300, y: 300)//,
//        CGPoint(x: 0, y: 0),
//        CGPoint(x: 0, y: 0),
//        CGPoint(x: 0, y: 0)
    ]

   // @State var pos: [CGFloat] = [50, 100, 150, 160]
    @State var MyImages: [UIImage] = [
        UIImage(named: "X")!,
        UIImage(named: "Eyes")!//,
//        UIImage(named: "Done!")!,
//        UIImage(named: "Fire")!,
//        UIImage(named: "Comment")!
    ]
    
    @State var imgTemporary: UIImage!
//    @State var contador: Int = 0
    @State var controle:Bool = false
    
    var body: some View{
        ZStack{
            Color(red: 255/255, green: 204/255, blue: 207/255).ignoresSafeArea(.all)
            
            ZStack(alignment: .bottomLeading){
                Button("CLICK-ME"){
                    Image(uiImage: MyImages[0])
//                        .frame(width: 50, height: 50, alignment: .center)
//                    loadImages(imageArray: MyImages, posArray: positions)
                    print("foi clicado")
                }
            }
        }
    }
}

func loadImages(imageArray:[UIImage], posArray:[CGPoint]){
    ForEach {
        Image(uiImage: imageArray[i])
            .frame(width: 150, height: 50, alignment: .center)
//            .offset(x: 150, y: 150)
//            .position(posArray[i])
        print("funcao executada")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
