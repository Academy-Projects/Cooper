//
//  OnBoardingView.swift
//  Cooper
//
//  Created by kevin marinho on 06/09/22.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("blocked")
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                
                HStack{
                    Button(action:{} , label: {Text("SKIP")})
                    
                    Button(action:{} , label: {Text("PAGEVIEW")})
                    
                    Button(action:{} , label: {Text("NEXT")})
                }
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
