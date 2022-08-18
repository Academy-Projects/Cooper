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

                ForEach(0 ..< MyImages.count, id: \.self){imageIdx in
                    Image(uiImage: MyImages[imageIdx])
                        .position(positions[imageIdx])
                        .onTapGesture {
                            if (imageIdx != (MyImages.count - 1)) {
                                posTemporary = positions[MyImages.count - 1]
                                positions[MyImages.count - 1] = positions[imageIdx]
                                positions[imageIdx] = posTemporary

                                imgTemporary = MyImages[MyImages.count - 1]
                                MyImages[MyImages.count - 1] = MyImages[imageIdx]
                                MyImages[imageIdx] = imgTemporary
                            }
                        }
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    isDraggin = true
                                    positions[imageIdx] = value.location
                                    
                                })
                                .onEnded({ value in
                                    
                                })
                        )
                    }
                }
            VStack(){
                Button("CLICK-ME"){
                    MyImages += [UIImage(named: "X")!]
                    positions.append(CGPoint(x: 0, y: 0))
                    print(MyImages)
                    print(positions)
                }.frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
            
                Button("Mudar"){
                    imgTemporary = MyImages[1]
                    MyImages[1] = MyImages[0]
                    MyImages[0] = imgTemporary
                    print(MyImages.count)
                }.frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(.blue)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
