//
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI

struct DrawnView: View {
    
    @State var positions : [CGPoint] = [
        CGPoint(x: 100, y: 100),
        CGPoint(x: 300, y: 300),
        CGPoint(x: 0, y: 0),
        CGPoint(x: 0, y: 0),
        CGPoint(x: 0, y: 0)
    ]
    @State var MyImages: [UIImage] = [
        UIImage(named: "X")!,
        UIImage(named: "Eyes")!,
        UIImage(named: "Done!")!,
        UIImage(named: "Fire")!,
        UIImage(named: "Comment")!
    ]
    
    @State var imgTemporary: UIImage!
    @State var contador: Int = 0
    @State var controle:Bool = false
    
    var body: some View{
        ZStack{
            Color(red: 255/255, green: 204/255, blue: 207/255).ignoresSafeArea(.all)
            
            ZStack(alignment: .bottomLeading){
                ForEach(0..<MyImages.count){imageIdx in
                    Image(uiImage: MyImages[imageIdx])
                        .position(positions[imageIdx])
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    positions[imageIdx] = value.location
                                    if(controle == false){
                                    imgTemporary = MyImages[imageIdx]
                                    MyImages[imageIdx] = MyImages[imageIdx - 1]
                                    MyImages[imageIdx - 1] = imgTemporary
                                    controle = true
                                    }
                                })
                                .onEnded({ value in
                                    
                                })
                        )
                }
            }
            .border(Color.black, width: 6)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
