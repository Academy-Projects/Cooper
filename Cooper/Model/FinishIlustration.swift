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
            VStack(spacing: 25){
                    ZStack{
                        Image("trofeu")
                           // .frame(width: UIScreen.main.bounds.width * )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    
                    ZStack{
                        Text("Atenção!")
                           // .foregroundColor(.yellow)
                            .bold()
                            .font(Font.custom("Boogaloo-Regular", size: 40))
                        
                    }
                    
                    Text("Desenho finalizado! Mostre aos policiais e torça para que entendam!")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width * 0.33)
                        .font(Font.custom("SourceSans3-Regular", size: 20))
                    
                    NavigationLink(destination: AnswerFinalView(ilustrationScene: gameScene), label: {
                        Text("Mostrar opções")
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
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.45)
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .cornerRadius(25)
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundPopUp"), Color("backgroundIlustrationWhite")]),
                                         startPoint: .top,
                                         endPoint: .bottom))
            .cornerRadius(20)
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


