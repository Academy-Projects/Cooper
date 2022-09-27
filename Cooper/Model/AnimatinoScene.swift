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
        var animation2: [SKTexture] = []
        var animation3: [SKTexture] = []
        
        
    }
}
