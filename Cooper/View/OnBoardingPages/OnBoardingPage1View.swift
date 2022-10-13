//
//  OnBoardingPage1.swift
//  Cooper
//
//  Created by Matheus Costa on 27/09/22.
//

import Foundation
import SwiftUI
import SpriteKit
    
struct OnBoardingPage1: View{
    var onboardingSteps:[OnboardingStep]
    @AppStorage ("isOnboarding") public var  isOnboarding: Bool = true
    @Environment(\.presentationMode) var presentationMode
    @State var font = FontViewModel()
    
    public var Ascene: SKScene{
        let animationScene = AnimationScene()
        animationScene.index = 0
        animationScene.scaleMode = .fill
        return animationScene
    }
    
    var body: some View{
        VStack{
            HStack{
                VStack{ // Cena da animação.
                    SpriteView(scene: Ascene, isPaused: false, options: [.allowsTransparency])
                }
                .frame(width: UIScreen.main.bounds.width * 0.416, height: UIScreen.main.bounds.height * 0.63, alignment: .leading)
                .padding(.leading, 90)
                .padding(.trailing, 40)
                Spacer()
                
                VStack{
                    Text(onboardingSteps[0].caso)
                        .font(Font.custom(font.font.FontBoogaloo, size: 55))
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.37, height: UIScreen.main.bounds.height * 0.13, alignment: .leading)
                        .foregroundColor(Color(red: 0/255, green: 62/255, blue: 89/255))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 30)
                  //  Spacer()
                    Text(onboardingSteps[0].isntruction)
                        .font(Font.custom(font.font.FontSourceSansRegular, size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.37, height: UIScreen.main.bounds.height * 0.13, alignment: .leading)
                        .foregroundColor(Color.colorFontDark)
                       // .padding(.trailing, 15)
                        .multilineTextAlignment(.leading)
                       // .padding(.bottom, 300)
                }
                .padding(.trailing, 80)
            }.frame(height: UIScreen.main.bounds.height * 0.68)
        }
        .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.height * 0.89)
    }
}
