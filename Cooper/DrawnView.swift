//
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI

struct DrawnView: View {
    @State var idDragging = false
    
    @State var positions : [CGPoint] = [
        CGPoint(x: 0, y: 0),
        CGPoint(x: 0, y: 0),
        CGPoint(x: 0, y: 0),
        CGPoint(x: 0, y: 0),
        CGPoint(x: 0, y: 0)
    ]
    
   // @State var pos: [CGFloat] = [50, 100, 150, 160]
    @State var MyImages: [UIImage] = [
        UIImage(named: "X")!,
        UIImage(named: "Eyes")!,
        UIImage(named: "Done!")!,
        UIImage(named: "Fire")!,
        UIImage(named: "Comment")!
    ]
    var body: some View{
        ZStack{
            Color(red: 255/255, green: 204/255, blue: 207/255).ignoresSafeArea(.all)
            
            ZStack() {
                ForEach(0..<MyImages.count){imageIdx in
                    Image(uiImage: MyImages[imageIdx])
                        .position(positions[imageIdx])
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    positions[imageIdx] = value.location
                                    idDragging = true
                                })
                                .onEnded({ value in
//                                    position = .zero
                                    idDragging = false
                                })
                        )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.portrait)
    }
}
