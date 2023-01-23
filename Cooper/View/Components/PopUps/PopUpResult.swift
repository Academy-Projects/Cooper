//
//  ResultAlert.swift
//  Cooper
//
//  Created by Matheus Costa on 07/09/22.
//

import Foundation
import SwiftUI

struct CustomAlertView: View{
    //booleano criado para verificar se popup aparece ou nao
    @Binding var show : Bool
    // booleado para verificar se o resultado ta certo ou nao
    @State var result:Bool
    // variavel criado para voltar para tela anterior caso a funcao seja chamada
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            VStack(spacing: 25){
                if(result){
                    ZStack{
                        Image("trofeu")
                           // .frame(width: UIScreen.main.bounds.width * )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //circulo criado para chamar a funcao de confetti chamando o atributo ParticlesModifier
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 12, height: 12)
                            .modifier(ParticlesModifier())
                            .offset(x: -50, y: -25)
                        
                    }
                    
                    ZStack{
                        Text("Parabéns!")
                            .foregroundColor(Color(red: 98/255, green: 153/255, blue: 51/255))
                            .bold()
                            .font(Font.custom("Boogaloo-Regular", size: 40))
                        //circulo criado para chamar a funcao de confetti chamando o atributo ParticlesModifier
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 12, height: 12)
                            .modifier(ParticlesModifier())
                            .offset(x: 100, y: -25)
                        
                    }
                    
                    Text("Os policiais entenderam o que você ilustrou e você tá liberado. Essa foi por pouco hein?")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width * 0.33)
                        .font(Font.custom("SourceSans3-Regular", size: 20))
                    
                    NavigationLink(destination: HistoryView(), label: {
                        Text("Voltar ao menu inicial")
                            .foregroundColor(Color("colorFont"))
                            .font(Font.custom("Boogaloo-Regular", size: 22))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                          //  .padding(EdgeInsets(top: 247, leading: 340, bottom:0 , trailing: 12))
                            .foregroundColor(.white)
                            .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                            )
                            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                        })
                    //funcao utilizada para que a animacao do botao clicado nao seja mostrada
                    //solucao encontrada para nao dar o contraste da sombra ao ser clicado
                          .buttonStyle(FlatLinkStyle())
                          .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.046)
                          //.padding(.trailing, 34)

                }else{
                    Image("algema")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("ih, ferrou! ")
                        .foregroundColor(.red)
                        .bold()
                        .font(Font.custom("Boogaloo-Regular", size: 40))
                    Text("Os policiais não entenderam o que você ilustrou e agora você está preso.")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width * 0.33)
                        .font(Font.custom("SourceSans3-Regular", size: 20))
                    HStack(spacing: 25){
                        //navigation link criado chamando o index que foi escolhido anteriormente pela variavel global indexQuestion
                        NavigationLink(destination: PremiseView(story: naps[indexQuestion]), label: {
                            Text("Tentar novamente")
                                .foregroundColor(Color("colorFont"))
                                .font(Font.custom("Boogaloo-Regular", size: 22))
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                              //  .padding(EdgeInsets(top: 247, leading: 340, bottom:0 , trailing: 12))
                                .foregroundColor(.white)
                                .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                )
                                .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                            })
                        //funcao utilizada para que a animacao do botao clicado nao seja mostrada
                        //solucao encontrada para nao dar o contraste da sombra ao ser clicado
                              .buttonStyle(FlatLinkStyle())
                              .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.046)
                          //    .padding(.trailing, 34)
                        
                        NavigationLink(destination: HistoryView(), label: {
                            Text("Voltar ao menu inicial")
                                .foregroundColor(Color("colorFont"))
                                .font(Font.custom("Boogaloo-Regular", size: 22))
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                              //  .padding(EdgeInsets(top: 247, leading: 340, bottom:0 , trailing: 12))
                                .foregroundColor(.white)
                                .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 1)
                                )
                                .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
                            })
                        //funcao utilizada para que a animacao do botao clicado nao seja mostrada
                        //solucao encontrada para nao dar o contraste da sombra ao ser clicado
                              .buttonStyle(FlatLinkStyle())
                              .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.046)
                        //      .padding(.trailing, 34)
                        
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.45)
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .cornerRadius(25)
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
            .cornerRadius(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
