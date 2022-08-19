// será que essa porra funciona ???
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI
import SpriteKit

struct ViewSizeKey: PreferenceKey {
    static var defaultValue = CGSize.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct DrawnView: View {
//<<<<<<< HEAD
//    @State private var size = CGSize.zero
//
//    @State var pogPosition : [CGPoint] = [
//    CGPoint(x: 0, y: 0),
//    CGPoint(x: 0, y: 0)
//    ]
//
//    @State var images: [UIImage] = [
//    UIImage(named: "Fire")!,
//    UIImage(named: "Eyes")!
//    ]
//
//    var body: some View{
//        ZStack{
//        GeometryReader { gp in
//            ForEach(0..<images.count){ imageIdx in
//            Image(uiImage: images[imageIdx])
//                .background(GeometryReader {
//                    Color.clear
//                        .preference(key: ViewSizeKey.self, value: $0.frame(in: .local).size)
//                })
//                .onPreferenceChange(ViewSizeKey.self) {
//                    self.size = $0
//                }
//                .position(pogPosition[imageIdx])
//                .gesture(
//                    DragGesture()
//                        .onChanged { value in
//                            let rect = gp.frame(in: .local)
//                                .inset(by: UIEdgeInsets(top: size.height / 2.0, left: size.width / 2.0, bottom: size.height / 2.0, right: size.width / 2.0))
//                            if rect.contains(value.location) {
//                                self.pogPosition[imageIdx] = value.location
//                            }
//                        }
//                        .onEnded { value in
//                            print(value.location)
//                        }
//            )
//            .onAppear {
//                let rect = gp.frame(in: .local)
//                self.pogPosition[imageIdx] = CGPoint(x: rect.midX, y: rect.midY)
//            }
//        }.edgesIgnoringSafeArea(.all)
//     }
//        }.background(.cyan)
//  }

        
//=======
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
        ZStack{
         HStack{
            ZStack{
                SpriteView(scene: scene)
            }
        VStack{
            Text("Escolhe ai uma carta a irmao")
            ScrollView{
                HStack{
                    Button(action: {}) {
                        VStack {
                            Image("Fire")
                          //  Text("Hello world!")
                        }
                        .padding()
                        //.accentColor(Color(.systemRed))
                        .background(.gray)
                        .cornerRadius(34.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                        )
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image("X")
                          //  Text("Hello world!")
                        }
                        .padding()
                        //.accentColor(Color(.systemRed))
                        .background(.gray)
                        .cornerRadius(34.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                        )
                    }
                }
                Spacer()
                Spacer()
                HStack{
                    Button(action: {}) {
                        VStack {
                            Image("Done!")
                          //  Text("Hello world!")
                        }
                        .padding()
                        //.accentColor(Color(.systemRed))
                        .background(.gray)
                        .cornerRadius(34.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                        )
                    }
                    
                    Button(action: {}) {
                        VStack {
                            Image("Eyes")
                          //  Text("Hello world!")
                        }
                        .padding()
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
        }.background(.gray)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
