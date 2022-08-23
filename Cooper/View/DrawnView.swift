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
    
    let gameScene = GameScene()
    
    var scene: SKScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
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
                Spacer()
                HStack{
                    Button(action: {gameScene.createNewObj(image: "Fire")}) {
                        VStack {
                            Image("Fire")
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
                    
                    Button(action: {gameScene.createNewObj(image: "X")}) {
                        VStack {
                            Image("X")
                                .resizable()
                          //  Text("Hello world!")
                        }
                        .padding()
                        .frame(width: 161, height: 168)
                        //.accentColor(Color(.systemRed))
                        .background(.gray)
                        .cornerRadius(34.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                        )
                    }
                }
               // Spacer()
                Spacer(minLength: 20)
                HStack{
                    Button(action: {gameScene.createNewObj(image: "Done!")}) {
                        VStack {
                            Image("Done!")
                                .resizable()
                          //  Text("Hello world!")
                        }
                        .padding()
                        .frame(width: 161, height: 168)
                        //.accentColor(Color(.systemRed))
                        .background(.gray)
                        .cornerRadius(34.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2)
                        )
                    }
                    
                    Button(action: {gameScene.createNewObj(image: "Eyes")}) {
                        VStack {
                            Image("Eyes")
                                .resizable()
                          //  Text("Hello world!")
                        }
                        .padding()
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
                NavigationLink(destination: AnswerFinalView(), label: {
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
