//
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
//                                    idDragging = true
                                })
                                .onEnded({ value in
//                                    position = .zero
//                                    idDragging = false
                                })
                        )
                }
            }
            .border(Color.black, width: 6)
            
//            Button("click"){
//                Image(uiImage: MyImages[0])
//                   .position(positions[0])
//                   .gesture(
//                       DragGesture()
//                           .onChanged({ value in
//                               positions[0] = value.location
//                               MyImages[0] = MyImages[0]
////                                    idDragging = true
//                           })
//                           .onEnded({ value in
////                                    position = .zero
////                                    idDragging = false
//                           })
//                   )
//            }.frame(width: 300, height: 300, alignment: .center)
            
        }
    }
}

//func lacofor () {
//    @State var positions : [CGPoint] = [
//        CGPoint(x: 0, y: 0),
//        CGPoint(x: 0, y: 0)//,
////        CGPoint(x: 0, y: 0),
////        CGPoint(x: 0, y: 0),
////        CGPoint(x: 0, y: 0)
//    ]
//
//   // @State var pos: [CGFloat] = [50, 100, 150, 160]
//    @State var MyImages: [UIImage] = [
//        UIImage(named: "X")!,
//        UIImage(named: "Eyes")!//,
////        UIImage(named: "Done!")!,
////        UIImage(named: "Fire")!,
////        UIImage(named: "Comment")!
//    ]
//
//
//    ForEach(0..<MyImages.count){imageIdx in
//        Image(uiImage: MyImages[imageIdx])
//            .position(positions[imageIdx])
//            .gesture(
//                DragGesture()
//                    .onChanged({ value in
//                        positions[imageIdx] = value.location
//                        MyImages[imageIdx] = MyImages[0]
////                                    idDragging = true
//                    })
//                    .onEnded({ value in
////                                    position = .zero
////                                    idDragging = false
//                    })
//            )
//    }
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
