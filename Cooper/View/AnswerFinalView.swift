//
//  AnswerFinalView.swift
//  Cooper
//
//  Created by kevin marinho on 23/08/22.
//
import SwiftUI
import SpriteKit

struct AnswerFinalView: View {
    
    var ilustrationScene: GameScene
    
    var body: some View{
        ZStack{
//            background(Color.gray)
            
            HStack{
                //adiciona um screenshot da Illustration scene
                Image(uiImage: ilustrationScene.takeScreenshot(scene: ilustrationScene))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 700, height: 700, alignment: .center)
                    .border(Color.black, width: 10)
                VStack{
                    Button(action: {ilustrationScene.removeAllChildren()},
                           label: {
                            Text("Option 1")
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 200)
                            .background(Color.blue.cornerRadius(20))
                    })
                    Button(action: {ilustrationScene.removeAllChildren()},
                           label: {
                            Text("Option 2")
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 200)
                            .background(Color.blue.cornerRadius(20))
                    })
                    Button(action: {ilustrationScene.removeAllChildren()},
                           label: {
                            Text("Option 3")
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 200)
                            .background(Color.blue.cornerRadius(20))
                    })
                }
            }
        }.background(.gray)
    }
}

struct SampleDetails: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View {
        Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Rectangle()
            Text("")
                .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .background(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
        }.padding(.leading, 600)
    }
    
    var body: some View {
            List {
                Text("sample code")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}
