//
//  DraggableSprite.swift
//  Cooper
//
//  Created by Matheus Costa on 31/08/22.
//

import Foundation
import SpriteKit

class DraggableSprite: SKSpriteNode{
    init() {
        let node = SKSpriteNode(
            color: .red,
            size: CGSize(width: 50, height: 50)
        )
        node.name = "draggable"
        self.addChild(node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
