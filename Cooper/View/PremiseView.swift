//
//  PremiseView.swift
//  Cooper
//
//  Created by kevin marinho on 30/08/22.
//

import SwiftUI

//teste


struct PremiseView: View {
    
    var story: ListHistory = naps[0]
    @State var cor:Color = Color(red: 0/255, green: 59/255, blue: 75/255)
    
    @State var buttonPressed:Int = 0
    @State var opacityButton:Double = 1
    @State var opacityPlay: Double = 0
    
    var body: some View {
        ZStack{
            HStack(){
                VStack{
                    ZStack{
                        NavigationLink(destination: HistoryView(), label: {
                      //      Rectangle()
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .padding(.vertical, 6)
                                .font(Font.custom("SourceSans3-Bold", size: 10))
                                .foregroundColor(Color("colorFont"))
                                .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .background(RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 1)
                                )
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.leading, 24)
                        .padding(.top, 24)


                VStack{
                    Image(story.image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.24, height: UIScreen.main.bounds.height * 0.20)
                        //.padding(.top, 42)
                    
                    Text(story.title)
                        .font(Font.custom("SourceSans3-Bold", size: 20))
                        .bold()
                    
                    Divider()
                        .frame(width: 357, height: 2 , alignment: .center)
                        .overlay(.green)
                    
                        Text(story.premise)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(Font.custom("SourceSans3-Bold", size: 20))
                            .frame(width: UIScreen.main.bounds.width * 0.43)
                    }.frame(width: UIScreen.main.bounds.width * 0.46)
                }
            }
                
                Divider()
                    .frame(width: 2, height: UIScreen.main.bounds.height * 0.81)
                    .overlay(.green)
            ZStack{
                VStack{
                    Text(story.instruction)
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(Font.custom("SourceSans3-Bold", size: 20))
                    .frame(width: UIScreen.main.bounds.width * 0.39, height: UIScreen.main.bounds.height * 0.10)
                    .padding(.trailing, 60)
                    .padding(.leading, 60)
                    //.padding(.top, 180)
                    
                    Button(action: {
                                buttonPressed = 1
                                opacityButton = 0.1
                                opacityPlay = 1
                            },
                           label: {
                           
                                if buttonPressed == 1{
                                    Text(story.finalOne)
                                        //.font(.system(size: 55))
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                    
                                } else{
                                    Text(story.finalOne)
                                       // .font(.system(size: 55))
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                }
                            })
                                .frame(width: UIScreen.main.bounds.width * 0.35)
                                .padding(.bottom, 8)
            //        Spacer()
                    Button(action: {
                            
                            buttonPressed = 2
                            opacityButton = 0.1
                            opacityPlay = 1
                            },
                           label: {
                                if buttonPressed == 2{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                } else{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                }
                            })
                                .frame(width: UIScreen.main.bounds.width * 0.35)
                                .padding(.bottom, 8)
                   // Spacer()
                    Button(action: {
                            
                            buttonPressed = 3
                            opacityButton = 0.1
                            opacityPlay = 1
                            },
                           label: {
                                if buttonPressed == 3{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                } else{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                                        .opacity(opacityButton)
                                        .animation(.easeInOut(duration: 0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                }
                            })
                                .frame(width: UIScreen.main.bounds.width * 0.35)
                                .padding(.bottom, 8)
                    
                    Text(story.warning)
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(Font.custom("SourceSans3-Bold", size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.43, height: UIScreen.main.bounds.height * 0.13)
                    
                    
                }.frame(width: UIScreen.main.bounds.width * 0.50)
                VStack(){
                    Spacer()
                    NavigationLink(destination: DrawnView(), label: {
                        Text("Jogar")
                            .font(Font.custom("SourceSans3-Bold", size: 20))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                          //  .padding(EdgeInsets(top: 247, leading: 340, bottom:0 , trailing: 12))
                            .foregroundColor(.white)
                            .background(Color(red: 0/255, green: 59/255, blue: 75/255))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .background(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                            )
                        }).opacity(opacityPlay)
                          .animation(.easeInOut(duration: 0.5))
                          .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.063)
                          .padding(.trailing, 34)
                          
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                     .padding(.bottom, 36)
          }
        } .navigationBarHidden(true)
    }
  }
}
