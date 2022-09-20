//
//  OnBoardingView.swift
//  Cooper
//
//  Created by kevin marinho on 06/09/22.
//

import SwiftUI

struct OnboardingStep{
    let image: String
    let isntruction: String
}
//teste
private let OnboardingSteps = [
    OnboardingStep(image: "blocked", isntruction: "Esse é o Cooper, um viajante que está sempre encontrando novos lugares para conhecer ao redor do mundo e você pode ajudá-lo a escolher o próximo destino."),
    OnboardingStep(image: "blocked", isntruction: "Mas Cooper sempre se mete em encrencas, já que não sabe a língua local dos países que passa então você irá embarcar nessa jornada junto dele e precisam sair dessa juntos."),
    OnboardingStep(image: "blocked", isntruction: "Ajude Cooper se expressar por meio de pictogramas e evitar que sejam presos por conta de suas desventuras mal entendidas. Lembre-se: a comunicação é a chave.")
]

struct OnBoardingView: View {
    @AppStorage ("isOnboarding") var  isOnboarding: Bool?
    
    @State private var currentStep = 0
    
    var body: some View {
        ZStack{
            TabView(selection: $currentStep){
                ForEach(0..<OnboardingSteps.count){ it in
            VStack{
                        Image(OnboardingSteps[it].image)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.69, height: UIScreen.main.bounds.height * 0.49)
                            .padding(.bottom, 24)
                            .padding(.top, 64)
                        
                        Text(OnboardingSteps[it].isntruction)
                            .frame(width: UIScreen.main.bounds.width * 0.49)
                            .foregroundColor(Color("colorFont"))
                            //.padding(.bottom, 20)
                            .font(Font.custom("SourceSans3-Bold", size: 23))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        HStack(spacing: 0){
                            Button(action:{
                                isOnboarding = false
                            } , label: {Text("Pular")})
                                .font(Font.custom("SourceSans3-Regular", size: 22))
                                .foregroundColor(Color("colorFont"))
                    
                            Spacer()
                            
                            HStack{
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
                           // condicao que verifica a quatidade de elementos para se tornar e view e verifica se é a ultima para que possa seguir para o app
                            // a aplicacao nao volta pra essa view a nao ser que seja apagada
                            Button(action:{
                                if self.currentStep < OnboardingSteps.count - 1{
                                    self.currentStep += 1
                                } else{
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
    }
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
