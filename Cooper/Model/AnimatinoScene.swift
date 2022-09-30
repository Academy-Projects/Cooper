//
//  AnimatinoScene.swift
//  Cooper
//
//  Created by Matheus Costa on 27/09/22.
//

import Foundation
import SwiftUI
import SpriteKit

class AnimationScene: SKScene{
    
    var index:Int = 1
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        self.backgroundColor = .clear
    }
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        // node de animação
        let AnimationNode = SKSpriteNode(imageNamed: "video2_00000")

        self.size = AnimationNode.size

        self.addChild(AnimationNode)

        var animation1: [SKTexture] = []
        var animation2: [SKTexture] = []
        var animation3: [SKTexture] = []
        var animation4: [SKTexture] = []

        // Cria o vetor com as imagens da animação 1.
        for index in 0...122{
            let fileName = "video2_" + String(format: "%05d", index)
            animation1 += [SKTexture(imageNamed: fileName)]
        }
        // Cria o vetor com as imagens da animação 2.
        for index in 1...2{
            let fileName = "frame" + String(format: "%00d", index)
            animation2 += [SKTexture(imageNamed: fileName)]
        }
        // Cria o vetor com as imagens de animação 3.
        for index in 0...359{
            let fileName = "Onboarding" + String(format: "%03d", index)
            animation3 += [SKTexture(imageNamed: fileName)]
        }
        // Cria o vetor com as imagens de animação 4.
        for index in 1...2{
            let fileName = "forthAnimation" + String(format: "%00d", index)
            animation4 += [SKTexture(imageNamed: fileName)]
        }
        
        if(index == 0){
            AnimationNode.run(.repeatForever(.animate(with: animation1, timePerFrame: 0.1)))
        }else if(index == 1){
            AnimationNode.run(.repeatForever(.animate(with: animation2, timePerFrame: 1)))
        }else if(index == 2){
            AnimationNode.run(.repeatForever(.animate(with: animation3, timePerFrame: 0.05)))
        }else if(index == 3){
            AnimationNode.run(.repeatForever(.animate(with: animation4, timePerFrame: 1)))
        }
        else{
            AnimationNode.run(.repeatForever(.animate(with: animation1, timePerFrame: 0.1)))
        }
    }
}
