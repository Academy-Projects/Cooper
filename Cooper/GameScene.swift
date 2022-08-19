import SwiftUI
import SpriteKit
import Foundation

public var layerCount = 0

class GameScene: SKScene{
    var player = SKSpriteNode()
    var player2 = SKSpriteNode()
    private var currentNode: SKNode?
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .white
    }
    
    public func createNewObj(image:String){
        let spriteNode = DraggableNode()
        let texture = SKTexture(imageNamed: image)
        let action = SKAction.setTexture(texture, resize: true)
        spriteNode.sprite.run(action)
        self.addChild(spriteNode)
    }
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    override func update(_ currentTime: CFTimeInterval){
        
    }

}
