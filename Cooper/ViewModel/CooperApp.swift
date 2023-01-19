//
//  CooperApp.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import SwiftUI

@main
struct CooperApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
//            Condicao que verifica se view ja foi vista alguma vez pelo usuario
            NavigationView{
                    SplashScreenView()
            }
              .navigationBarHidden(true)
              .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

