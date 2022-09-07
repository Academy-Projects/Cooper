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
    // Cria um tipo de apresentação.
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            HStack(){
                VStack{
                    ZStack{
                    HStack{
                        // Botão para voltar uma tela.
                        Button(action: {presentationMode.wrappedValue.dismiss()},
                               label: {
                                    Rectangle()
                                    Image(systemName: "chevron.left")
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .foregroundColor(Color("colorFont"))
                                        .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                        .background(Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .background(RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                        )
                                }).frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                  .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 9))
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                     .frame(maxHeight: .infinity, alignment: .top)
                     .padding(.leading, 28)

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
                //divisor da tela
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
                    
                    //botoes de opcoes de escolha
                    
                    Button(action: {
                                buttonPressed = 1
                                opacityButton = 0.1
                                opacityPlay = 1
                                answerChoice = 1 // Armazena 1 se a primeiro botão for pressionado
                            },
                           label: {
                           
                                if buttonPressed == 1{
                                    Text(story.finalOne)
                                        //.font(.system(size: 55))
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .leading)
                                        .multilineTextAlignment(.leading)
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
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .leading)
                                        .multilineTextAlignment(.leading)
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
                            answerChoice = 2 // Armazena 2 se a segundo botão for pressionado
                            },
                           label: {
                                if buttonPressed == 2{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                } else{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .leading)
                                        .multilineTextAlignment(.leading)
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
                            answerChoice = 3 // Armazena 3 se a terceiro botão for pressionado
                            },
                           label: {
                                if buttonPressed == 3{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(cor)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear.opacity(12.2), lineWidth: 1)
                                        )
                                } else{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Regular", size: 20))
                                        .frame(width: UIScreen.main.bounds.width * 0.40, alignment: .leading)
                                        .multilineTextAlignment(.leading)
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
