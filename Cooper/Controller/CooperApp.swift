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
            ContentView()
//            if isOnboarding{
//                OnBoardingView()
//            }else{
//                ContentView()
//            }
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()

//    }
//}
