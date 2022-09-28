//
//  OnBoardingView.swift
//  Cooper
//
//  Created by kevin marinho on 06/09/22.
//

import SwiftUI
import SpriteKit
import SpriteKit

struct OnboardingStep{
    //variaveis da lista no onboarding
    let image: String
    let isntruction: String
    let gif: String
    let caso: String
}
//informacao das varias setadas no onboarding
private let OnboardingSteps = [
    OnboardingStep(image: "blocked", isntruction: "Você é Cooper, um viajante que azarado que sempre se mete em encrencas e está em  busca de novos destinos para suas aventuras.", gif: "let", caso: "Escolha o destino da sua próxima viagem"),
    OnboardingStep(image: "blocked", isntruction: "Leia o caso para os outros jogadores, que farão papel dos policiais, mas escolha sua explicação em segredo, viu?", gif: "lele", caso: "Leia em voz alta e escolha em silêncio"),
    OnboardingStep(image: "blocked", isntruction: "Evite ser preso por conta das suas desventuras mal entedidas. Organize os pictogramas até onde sua criatividade permitir.Será que você vai sair dessa?", gif: "let", caso: "Se expresse através de pictogramas"),
    OnboardingStep(image: "blocked", isntruction: "mais um pagina", gif: "let", caso: "")
]

// corpo do onboarding
struct OnBoardingView: View {
    //booleano que muda de estado de acordo com o booleado setado
    @AppStorage ("isOnboarding") public var  isOnboarding: Bool = true
    // variavel que define a estapa em que se passa as informacoes no momento
    @State private var currentStep = 0
    // variavel criado para voltar para tela anterior caso a funcao seja chamada
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            // tabview que chamada a estapa setada pelo idx da lista
            TabView(selection: $currentStep){
                OnBoardingPage1()
                OnBoardingPage2()
                OnBoardingPage3()
                OnBoardingPage4()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.89)
            .padding()
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                )
        }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                         startPoint: .leading,
                                         endPoint: .trailing))
         
        
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


