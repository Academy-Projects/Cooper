//
//  FinishIlustration.swift
//  Cooper
//
//  Created by kevin marinho on 23/09/22.
//

import Foundation
import SwiftUI
import SpriteKit

struct FinishIlustration: View{
    var gameScene: GameScene
    
    //booleano criado para verificar se popup aparece ou nao
    @Binding var showFinish : Bool
    // booleado para verificar se o resultado ta certo ou nao
    // variavel criado para voltar para tela anterior caso a funcao seja chamada
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            HStack(spacing: 25){
                    ZStack{
                        Image("trofeu")
                           // .frame(width: UIScreen.main.bounds.width * )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                VStack{
                    ZStack{
                        Text("Ei, viajante")
                           // .foregroundColor(.yellow)
                            .bold()
                            .font(Font.custom("Boogaloo-Regular", size: 40))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 100)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.28, height: UIScreen.main.bounds.height * 0.09)
                    .padding(.trailing, 100)
                    Spacer()
                    
                    Text("Desenho finalizado! Vire o Ipad para os outros jogadores e deixe que eles tentem compreender sua mensagem. Será que vão conseguir?")
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width * 0.33)
                        .font(Font.custom("SourceSans3-Regular", size: 20))

                    Spacer()
                    
                    NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
                        Text("Ok")
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
                          .frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.height * 0.04)
                          .padding(.leading, 250)
                }
                
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.27)
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .cornerRadius(25)
//            .background(Color.yellow)
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
            .cornerRadius(20)
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


