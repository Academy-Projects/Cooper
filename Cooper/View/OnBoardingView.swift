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

private let OnboardingSteps = [
    OnboardingStep(image: "blocked", isntruction: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    OnboardingStep(image: "blocked", isntruction: "qualquer outro texto"),
    OnboardingStep(image: "blocked", isntruction: "qualquer outro texto de novo")
]

struct OnBoardingView: View {
    
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
                                self.currentStep = OnboardingSteps.count - 1
                            } , label: {Text("Pular")})
                                .font(Font.custom("SourceSans3-Regular", size: 22))
                                .foregroundColor(Color("colorFont"))
                    
                            Spacer()
                            
                            Button(action:{} , label: {Text("...")})
                            
                            Spacer()
                            
                            Button(action:{
                                if self.currentStep < OnboardingSteps.count - 1{
                                    self.currentStep += 1
                                } else{
                                    //nothing
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
    }
}
