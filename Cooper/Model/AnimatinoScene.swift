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
    
    override func sceneDidLoad() {
        self.sceneDidLoad()
        self.backgroundColor = .clear
    }
    
    override func didMove(to view: SKView) {
        // node de animação
        let AnimationNode = SKNode()
        self.addChild(AnimationNode)
        
        var animation1: [SKTexture] = []
//        var animation2: [SKTexture] = []
//        var animation3: [SKTexture] = []
        
        for index in 0...122{
            let fileName = "video2_" + String(format: "%05d", index)
            animation1 += [SKTexture(imageNamed: fileName)]
        }
        
        AnimationNode.run(.repeatForever(.animate(with: animation1, timePerFrame: 0.1)))
    }
}
