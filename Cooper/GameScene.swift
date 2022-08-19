import SwiftUI
import SpriteKit
import Foundation

var player = SKSpriteNode()
var player2 = SKSpriteNode()

class GameScene: SKScene{
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .white
    }
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        player = SKSpriteNode(color: UIColor.black, size: CGSize(width: 100, height: 100))
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.position = CGPoint(x: 0, y: 0)
        player2.zPosition = 1
        
        player2 = SKSpriteNode(color: UIColor.red, size: CGSize(width: 100, height: 100))
        player2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player2.position = CGPoint(x: 10, y: 10)
        player2.zPosition = 2
        
        
        print("x: \(player.position.x), y:\(player.position.y)")
        
        self.addChild(player2)
        self.addChild(player)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.zPosition = 3
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            player.position.x = location.x
            player.position.y = location.y
        }
    }
    override func update(_ currentTime: CFTimeInterval){
        
    }

}
