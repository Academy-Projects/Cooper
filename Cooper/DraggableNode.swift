//
//  DraggableNode.swift
//  Cooper
//
//  Created by Matheus Costa on 19/08/22.
//

import Foundation
import SpriteKit
import SwiftUI

class DraggableNode: SKNode {
    
    var sprite: SKSpriteNode
    
    var firstTouchPos: CGPoint
    var secondTouchPos: CGPoint
    
    override init() {
        self.sprite = SKSpriteNode()
        firstTouchPos = CGPoint(x: 0, y: 0)
        secondTouchPos = CGPoint(x: 0, y: 0)
        super.init()
        
        self.zPosition = 0
        self.isUserInteractionEnabled = true
        self.addChild(sprite)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scene?.view?.isMultipleTouchEnabled = true
        layerCount += 1
        self.zPosition = CGFloat(layerCount)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let scene = self.scene
            let location = touch.location(in: scene!)
            print(self.zRotation)
            
            if touch == touches.first{
                firstTouchPos = location
            }else{
                secondTouchPos = location
            }
        }
        print("primeiro toque: \(firstTouchPos)\nsegundo toque: \(secondTouchPos)")

        if touches.count != 1 {
            let xCord = (firstTouchPos.x + secondTouchPos.x)/2
            let yCord = (firstTouchPos.y + secondTouchPos.y)/2
            
            let catetoOposto = secondTouchPos.y - firstTouchPos.y
            let catetoAdjacente = secondTouchPos.x - firstTouchPos.x
            
            let tangente = catetoOposto / catetoAdjacente
            let angulo = atan(tangente)
            let angulo2 = angulo - self.zRotation
            
            let action = SKAction.rotate(byAngle: angulo2, duration: 0.5)
            self.run(action)
            
            
            self.position = CGPoint(x: xCord, y: yCord)
            
            
            
        }
//        if let touch = touches.first, let scene = self.scene {
//            let touchLocation = touch.location(in: scene)
//            self.position = touchLocation
//        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.zPosition = 0
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.zPosition = 0
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
