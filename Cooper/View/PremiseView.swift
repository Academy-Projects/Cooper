//
//  PremiseView.swift
//  Cooper
//
//  Created by kevin marinho on 30/08/22.
//

import SwiftUI

struct PremiseView: View {
    
    var story: ListHistory = naps[0]
    @State var cor:Color = .blue
    @State var shouldHide = false
    
    @State var buttonPressed:Int = 0
    @State var opacityButton:Double = 1
    @State var opacityPlay: Double = 0
    @State private var animate = false
    
    var body: some View {
        ZStack{
            HStack{
                NavigationLink(destination: HistoryView(), label: {
                    Rectangle()
                    Text("")
                        .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }).frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                  .padding(EdgeInsets(top: 20, leading: 0, bottom: 6, trailing: 9))
                VStack{
                    Image(story.image)
                    
                    Text(story.title)
                    Divider()
                    Text(story.premise)
                }
                VStack{
                    Text(story.instruction)
                    
                    Button(action: {
                                buttonPressed = 1
                                opacityButton = 0.1
                        opacityPlay = 1
                            },
                           label: {
                                if buttonPressed == 1{
                                    Text(story.finalOne)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                } else{
                                    Text(story.finalOne)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.blue)
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                }
                            })
                    
                    Button(action: {
                            
                            buttonPressed = 2
                            opacityButton = 0.1
                        opacityPlay = 1
                            },
                           label: {
                                if buttonPressed == 2{
                                    Text(story.finalTwo)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                } else{
                                    Text(story.finalTwo)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.blue)
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                }
                            })
                    
                    Button(action: {
                            
                            buttonPressed = 3
                            opacityButton = 0.1
                            opacityPlay = 1
                            },
                           label: {
                                if buttonPressed == 3{
                                    Text(story.finalThree)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                } else{
                                    Text(story.finalThree)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.blue)
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                }
                            })
                    
                    Text(story.warning)
                    
                    NavigationLink(destination: DrawnView(), label: {
                        Text("Jogar")
                            .font(.system(size: 15))
                            .bold()
                            .frame(width: UIScreen.main.bounds.width * 0.21, height: UIScreen.main.bounds.height * 0.046)
    //                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 24, trailing: 10))
                        .background(Color.cyan.opacity(12.2))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.cyan.opacity(12.2), lineWidth: 1)
                        )
                    }).padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
                        .opacity(opacityPlay)
                        .animation(.easeInOut(duration: 0.5))
                       // .opacity(animate ? 1.0 : 0.0)

                    
                }
//                .onTapGesture {
//                            withAnimation(Animation.spring().speed(0.2)) {
//                                animate.toggle()
//              }
//            }
          }
        }.navigationBarHidden(true)
  }
}
