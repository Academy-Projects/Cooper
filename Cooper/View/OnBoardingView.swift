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
    OnboardingStep(image: "blocked", isntruction: "Ajude Cooper se expressar por meio de pictogramas e evitar que sejam presos por conta de suas desventuras mal entendidas. Lembre-se: a comunicação é a chave."),
    OnboardingStep(image: "blocked", isntruction: "mais um pagina")
]


struct OnBoardingView: View {
    @AppStorage ("isOnboarding") var  isOnboarding: Bool = true
    
    @State private var currentStep = 0
    @State private var pageSelected = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
        TabView(selection: $currentStep){
            HistoryView()
                .onAppear(){
                    pageSelected = 0
                }
            PremiseView()
                .onAppear(){
                    pageSelected = 1
                }
            DrawnView()
                .onAppear(){
                    pageSelected = 2
                }
            
        }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                HStack{
                    ForEach(0..<3){ it in
                        if it == pageSelected{
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
            )
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
