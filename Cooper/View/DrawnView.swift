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
    
    let gameScene = GameScene()

    public var scene: SKScene{
        gameScene.scaleMode = .resizeFill
        return gameScene
    }
    
    @State var imgTemporary: UIImage!
    @State var posTemporary:CGPoint =  CGPoint(x: 0, y: 0)
    @State var begginGesture:Bool = true
    
    @State var nImagem:Int = 0
    @State var isDraggin:Bool = false
    
    @State var imagens:[[String]] = [["altofalante", "bandeira", "bone", "chat", "sombrinha"], ["chat", "sombrinha", "presente", "bandeira", "bone"]]
    
    
    var body: some View{
ZStack{
    HStack{
        ZStack{
                SpriteView(scene: scene, isPaused: false)
            ZStack{
                HStack{
                        NavigationLink(destination: PremiseView(), label: {
                            Rectangle()
                            Text("<")
                                .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .background(RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 1)
                                )
                        }).frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                           // .padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 900))
                }.frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 24)
                .padding(.top, 24)
            }
            .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.90)
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                )
        }
            //.background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 13))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 10)
            //.overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.black))
            .background(RoundedRectangle(cornerRadius: 13)
            ).padding()
        VStack{
                Text("Clique nos cards que deseja \nusar para ilustrar a história")
                        .bold()
                        .foregroundColor(Color("colorFont"))
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 25, leading: 0, bottom: 14, trailing: 0))
                ScrollView{
                   // Spacer()
                    VStack{
                        ForEach(0..<(imagens[0].count)){imageidx in
                            HStack{
                                Button(action: {gameScene.createNewObj(image: imagens[0][imageidx])}){
                                    Image(imagens[0][imageidx])
                                        .resizable()
                                        .scaledToFit()
//                                                .background(.gray)
//                                                .cornerRadius(35.0)
//                                                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.black, lineWidth: 2))
                                
                                }.frame(width: UIScreen.main.bounds.width / 9)
                              //  Spacer()
                                Button(action: {gameScene.createNewObj(image: imagens[1][imageidx])}){
                                    Image(imagens[1][imageidx])
                                        .resizable()
                                        .scaledToFit()
//                                               .background(.gray)
//                                                .cornerRadius(34.0)
//                                                .overlay(RoundedRectangle(cornerRadius: 34).stroke(Color.black, lineWidth: 2))
                                
                                }.frame(width: UIScreen.main.bounds.width / 9)
                            }
                          }
                    }
                }
                NavigationLink(destination: SampleDetails(), label: {
                    Text("Terminei de ilustrar ")
                        .foregroundColor(Color("colorFont"))
                        .font(.system(size: 15))
                        .bold()
                        .frame(width: UIScreen.main.bounds.width * 0.21, height: UIScreen.main.bounds.height * 0.046)
//                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 24, trailing: 10))
                    .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .background(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 1)
                    )
                }).padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
            
        }.frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.93)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 85), radius: 10)
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 17))
           }.background(LinearGradient(gradient: Gradient(colors: [Color.white, Color("backgroundIlustration"), Color.white]),
                                       startPoint: .leading,
                                       endPoint: .trailing))

    
        NavigationLink(destination: HistoryView(), label: {
            Text("")
            //.frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .background(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }).padding(EdgeInsets(top: 61, leading: 48, bottom: 30, trailing: 20))
    
    }.navigationBarHidden(true)
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
