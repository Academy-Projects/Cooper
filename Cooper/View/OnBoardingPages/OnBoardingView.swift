//
//  OnBoardingView.swift
//  Cooper
//
//  Created by kevin marinho on 06/09/22.
//

import SwiftUI
import SpriteKit
import SpriteKit

public struct OnboardingStep{
    //variaveis da lista no onboarding
    let image: String
    let isntruction: String
    let gif: String
    let caso: String
}


// corpo do onboarding
struct OnBoardingView: View {
    //informacao das varias setadas no onboarding
    private let onboardingSteps = [
        OnboardingStep(image: "blocked", isntruction: "Você é Coolper, um viajante azarado que sempre se mete encrencas e está em  busca de novos destinos para suas aventuras.", gif: "let", caso: "Escolha o destino da sua próxima viagem"),
        OnboardingStep(image: "blocked", isntruction: "Leia o caso para os outros jogadores, que farão papel dos policiais, mas escolha sua explicação em segredo, viu?", gif: "lele", caso: "Leia em voz alta e escolha em silêncio"),
        OnboardingStep(image: "blocked", isntruction: "Evite ser preso por conta das suas desventuras mal entedidas. Organize os pictogramas até onde sua criatividade permitir.Será que você vai sair dessa?", gif: "let", caso: "Se expresse através de pictogramas"),
        OnboardingStep(image: "blocked", isntruction: "Mostre sua ilustração aos policiais e eles, juntos, deverão escolher a resposta que melhor se aplica ao caso. Se eles errem, você será preso, se não você está liberado para viver novas aventuras!", gif: "let", caso: "Aja de forma\ncolaborativa")
    ]
    //booleano que muda de estado de acordo com o booleado setado
    @AppStorage ("isOnboarding") public var  isOnboarding: Bool = true
    // variavel que define a estapa em que se passa as informacoes no momento
    @State private var currentStep:Int = 0
    // variavel criado para voltar para tela anterior caso a funcao seja chamada
    @Environment(\.presentationMode) var presentationMode
    
    @State var font = FontViewModel()
    
    var body: some View {
        ZStack{
            // tabview que chamada a estapa setada pelo idx da lista
            TabView(selection: $currentStep){
                OnBoardingPage1(onboardingSteps: onboardingSteps).tag(0)
                OnBoardingPage2(onboardingSteps: onboardingSteps).tag(1)
                OnBoardingPage3(onboardingSteps: onboardingSteps).tag(2)
                OnBoardingPage4(onboardingSteps: onboardingSteps).tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.89)
            .padding()
            .border(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 3)
                )
            // parte de baixo da tela
            VStack{
                Spacer()
                HStack(){
                    // botao com condicao para que verifique se a view ja foi mostrada uma vez no app
                    // a condicao existe para que o usuario possa ver a instrucoes novamente caso  queira
                    // para isso existe um botao que chama a view de onboarding
                    // Botão Pular
                    Button(action:{//botão pular
                        if isOnboarding == true {
                            self.isOnboarding = false
                        }else{
                            // else que faz com que view volta para anterior
                            //condicao so é chamada caso o usuario ja tenha passado pelo tutorial e esteja na tela por opcao propria
                            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                            impactMed.impactOccurred()
                            
                            presentationMode.wrappedValue.dismiss()
                        }
                      } , label: {Text("Pular")})
                        .font(Font.custom(font.font.FontSourceSansRegular, size: 22))
                        .foregroundColor(Color.colorFontDark)
            
                    Spacer()
                    //PageView
                    HStack{
                            // foreach criado para fazer o page view
                        //funciona contando as etapas atraves do current step
                        ForEach(0..<4){ it in
                            if it == currentStep{
                                Rectangle()
                                    .frame(width: 20, height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            } else {
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.gray)
                            }
                            
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        if currentStep < onboardingSteps.count - 1{
                            currentStep += 1
                        }else{
                            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                            impactMed.impactOccurred()
                            
                            presentationMode.wrappedValue.dismiss()
                            isOnboarding = false
                        }
                        
                    }, label:{
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 6)
                            .font(Font.custom(font.font.FontSourceSansRegular, size: 10))
                            .foregroundColor(Color.colorFontUnique)
                            .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                            .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .background(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 1)
                            )
                    })
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.04)
                .padding(.bottom, 25)
            }
        }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                         startPoint: .leading,
                                         endPoint: .trailing))
    }
}

