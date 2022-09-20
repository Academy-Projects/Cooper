//
//  PremiseView.swift
//  Cooper
//
//  Created by kevin marinho on 30/08/22.
//

import SwiftUI

//teste

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct PremiseView: View {
    
    var story: ListHistory = naps[0]
    @State var cor:Color = Color(red: 0/255, green: 59/255, blue: 75/255)
    let font = UIFont(name: "SourceSans3-Bold", size: 16)!
    @State var buttonPressed:Int = 0
    @State var opacityButton:Double = 1
    @State var opacityPlay: Double = 0
    // Cria um tipo de apresentação.
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    ZStack{
                    HStack{
                        // Botão para voltar uma tela.
                        Button(action: {
                            
                            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                            impactMed.impactOccurred()
                            
                            presentationMode.wrappedValue.dismiss()
                        },
                               label: {
                                    Rectangle()
                                    Image(systemName: "chevron.left")
                                        .font(Font.custom("SourceSans3-Bold", size: 20))
                                        .foregroundColor(Color("colorFont"))
                                        .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                        .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                        )
                                        .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 3, y: 3)
                                }).frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                  .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 0))
                                  .buttonStyle(FlatLinkStyle())
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                     .frame(maxHeight: .infinity, alignment: .top)
                     .padding(.leading, 28)
                     .padding(.top, -13)

                VStack{
                    ZStack{
                        Image(story.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.leading, 40)
                            .padding(.bottom, 10)
                    }.frame(width: UIScreen.main.bounds.width * 0.12, height: UIScreen.main.bounds.height * 0.14)
                    ZStack{
                        Text(story.title)
                            .font(Font.custom("Boogaloo-Regular", size: 35))
                            .foregroundColor(Color("colorFont"))
                            .bold()
                            .padding(.leading, 40)
                        
                        Divider()
                            .frame(width: 357, height: 2 , alignment: .center)
                            .overlay(Color("colorFont"))
                            .padding(.top, 80)
                            .padding(.leading, 40)
                    }.padding(.bottom, 22)
                        Text(story.premise)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(Font.custom("SourceSans3-Regular", size: 25))
                            .minimumScaleFactor(0.1) //<--Here
                            .frame(width: UIScreen.main.bounds.width * 0.39, height: UIScreen.main.bounds.height * 0.10)
                            .foregroundColor(Color("colorFont"))
                            .padding(.leading, 40)
                    }.frame(width: UIScreen.main.bounds.width * 0.46)
                }
            }
           ///////////////////////////     //divisor da tela/////////////////////////////////////////////
                Divider()
                    .frame(width: 4, height: UIScreen.main.bounds.height * 0.61)            
                    .overlay(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .background(RoundedRectangle(cornerRadius: 32)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
            ZStack{
                VStack(){
                    VStack(spacing: -20){
                        HStack{
                            Text(story.instruction)
                            .multilineTextAlignment(.leading)
                            .font(Font.custom("SourceSans3-Bold", size: 25))
                            .minimumScaleFactor(0.1) //<--Here
                            .frame(width: UIScreen.main.bounds.width * 0.39, height: UIScreen.main.bounds.height * 0.07)
                            .foregroundColor(Color("colorFont"))
                        }
                        .padding(.trailing, 60)
                        .padding(.leading, 20)
                        .padding(.top, 100)
                    //botoes de opcoes de escolha
                    VStack{
                    Button(action: {
                                buttonPressed = 1
                                opacityButton = 0.5
                                opacityPlay = 1
                                answerChoice = 1 // Armazena 1 se a primeiro botão for pressionado
                            },
                           label: {
                           
                                if buttonPressed == 1{
                                    Text(story.finalOne)
                                        //.font(.system(size: 55))
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
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
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
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
                               // .padding(.bottom, 8)
            //        Spacer()
                    Button(action: {
                            
                            buttonPressed = 2
                            opacityButton = 0.5
                            opacityPlay = 1
                            answerChoice = 2 // Armazena 2 se a segundo botão for pressionado
                            },
                           label: {
                                if buttonPressed == 2{
                                    Text(story.finalTwo)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
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
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
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
                         //       .padding(.bottom, 8)
                   // Spacer()
                    Button(action: {
                            
                            buttonPressed = 3
                            opacityButton = 0.5
                            opacityPlay = 1
                            answerChoice = 3 // Armazena 3 se a terceiro botão for pressionado
                            },
                           label: {
                                if buttonPressed == 3{
                                    Text(story.finalThree)
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
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
                                        .font(Font.custom("SourceSans3-Regular", size: 23))
                                        .minimumScaleFactor(0.1) //<--Here
                                        .frame(width: UIScreen.main.bounds.width * 0.40, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
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
                               // .padding(.bottom, 800)
                    }
                    .padding(.bottom, 90)
                    .padding(.top, 50)
                }
                }
                .frame(width: UIScreen.main.bounds.width * 0.50)
                .padding(.trailing, 30)
                VStack(){
                    Spacer()
                    NavigationLink(destination: DrawnView(), label: {
                        Text("Jogar")
                            .font(Font.custom("SourceSans3-Bold", size: 28))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("colorFont"))
                          //  .padding(EdgeInsets(top: 247, leading: 340, bottom:0 , trailing: 12))
                            .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .background(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                            )
                            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                        }).opacity(opacityPlay)
                          .buttonStyle(FlatLinkStyle())
                          .animation(.easeInOut(duration: 0.3))
                          .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.063)
                          .padding(.trailing, 85)
                         // .padding(.bottom,  53)
                          
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                     
          }.padding(.bottom, 36)
        }
            
            .background(Color("ColorBackgroundInside"))
            .frame(width: UIScreen.main.bounds.width * 0.94, height: UIScreen.main.bounds.height * 0.92)
            //.padding()
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 1)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .background(RoundedRectangle(cornerRadius: 21)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 14)
                )
    }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustrationWhite"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                startPoint: .leading,
                                endPoint: .trailing))  }
}
