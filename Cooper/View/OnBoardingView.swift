//
//  OnBoardingView.swift
//  Cooper
//
//  Created by kevin marinho on 06/09/22.
//

import SwiftUI

struct OnboardingStep{
    //variaveis da lista no onboarding
    let image: String
    let isntruction: String
    let gif: String
}
//informacao das varias setadas no onboarding
private let OnboardingSteps = [
    OnboardingStep(image: "blocked", isntruction: "Esse é o Cooper, um viajante que está sempre encontrando novos lugares para conhecer ao redor do mundo e você pode ajudá-lo a escolher o próximo destino.", gif: "let"),
    OnboardingStep(image: "blocked", isntruction: "Mas Cooper sempre se mete em encrencas, já que não sabe a língua local dos países que passa então você irá embarcar nessa jornada junto dele e precisam sair dessa juntos.", gif: "lele"),
    OnboardingStep(image: "blocked", isntruction: "Ajude Cooper se expressar por meio de pictogramas e evitar que sejam presos por conta de suas desventuras mal entendidas. Lembre-se: a comunicação é a chave.", gif: "let"),
    OnboardingStep(image: "blocked", isntruction: "mais um pagina", gif: "let")
]

// corpo do onboarding
struct OnBoardingView: View {
    //booleano que muda de estado de acordo com o booleado setado
    @AppStorage ("isOnboarding") var  isOnboarding: Bool = true
    // variavel que define a estapa em que se passa as informacoes no momento
    @State private var currentStep = 0
    // variavel criado para voltar para tela anterior caso a funcao seja chamada
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            // tabview que chamada a estapa setada pelo idx da lista
            TabView(selection: $currentStep){
                // foreach para ondenar as informacoes vindas da lista
                ForEach(0..<OnboardingSteps.count){ it in
            VStack{
                        Gif(OnboardingSteps[it].gif)
                   // .background(Color.le)
                        .frame(width: 200, height: 200)
//                            .resizable()
//                            .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.49)
//                            .padding(.bottom, 24)
//                            .padding(.top, 64)
                        
                        Text(OnboardingSteps[it].isntruction)
                            .frame(width: UIScreen.main.bounds.width * 0.49)
                            .foregroundColor(Color("colorFont"))
                            //.padding(.bottom, 20)
                            .font(Font.custom("SourceSans3-Bold", size: 23))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        HStack(spacing: 0){
                            // botao com condicao para que verifique se a view ja foi mostrada uma vez no app
                            // a condicao existe para que o usuario possa ver a instrucoes novamente caso  queira
                            // para isso existe um botao que chama a view de onboarding
                            Button(action:{
                                if isOnboarding == true {
                                    isOnboarding = false
                                }else{
                                    // else que faz com que view volta para anterior
                                    //condicao so é chamada caso o usuario ja tenha passado pelo tutorial e esteja na tela por opcao propria
                                    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                    impactMed.impactOccurred()
                                    
                                    presentationMode.wrappedValue.dismiss()
                                    


                                }
                              } , label: {Text("Pular")})
                                .font(Font.custom("SourceSans3-Regular", size: 22))
                                .foregroundColor(Color("colorFont"))
                    
                            Spacer()
                            
                            HStack{
                                    // foreach criado para fazer o page view
                                //funciona contando as etapas atraves do current step
                                ForEach(0..<OnboardingSteps.count){ it in
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
                            // teste
                           // condicao que verifica a quatidade de elementos para se tornar e view e verifica se é a ultima para que possa seguir para o app
                            // a aplicacao nao volta pra essa view a nao ser que seja apagada
                            Button(action:{
                                if self.currentStep < OnboardingSteps.count - 1{
                                    self.currentStep += 1
                                } else if self.currentStep >= 3{
                                    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                    impactMed.impactOccurred()
                                    
                                    presentationMode.wrappedValue.dismiss()
                                    
                                    isOnboarding = false
                                }
                            } ,
                                   label:{
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.vertical, 6)
                                    .font(Font.custom("SourceSans3-Regular", size: 10))
                                    .foregroundColor(Color("colorFont"))
                                    .frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                                    .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .background(RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1), lineWidth: 1)
                                    )
                                
                            })
                              //  .frame(width: UIScreen.main.bounds.width * 0.08)
                                
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 15)
                        
                    }.tag(it)
                    
                }
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
