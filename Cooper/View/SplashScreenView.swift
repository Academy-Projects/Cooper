//
//  SplashScreenView.swift
//  Cooper
//
//  Created by kevin marinho on 21/09/22.
//

import SwiftUI

struct SplashScreenView: View {
    
  private var fontViewModel = FontViewModel()
    
  @State var viewModel = SplashViewModel()
    
    
    var body: some View {
        if viewModel.splash.isActive{
            ContentView()
        }else{
            ZStack{
                VStack{
                    VStack{
                        Image(viewModel.splash.ImageCooper)
                            //.font(.system(size: 100))
                        Text("Coolper")
                            .font(Font.custom(fontViewModel.font.FontBoogaloo, size: 50))
                            .foregroundColor(Color.colorFontDark)
                    }
                    .scaleEffect(viewModel.splash.size)
                    .opacity(viewModel.splash.opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.viewModel.splash.size = 0.9
                            self.viewModel.splash.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        viewModel.splash.isActive = true
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                         startPoint: .leading,
                                         endPoint: .trailing))

        }
        
    }
}
