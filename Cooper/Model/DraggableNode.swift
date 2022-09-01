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
 
    var touchOffset:CGPoint = CGPoint(x: 0, y: 0)
    
    override init() {
        self.sprite = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        super.init()
        
        self.zPosition = 0
        self.isUserInteractionEnabled = true
        self.addChild(sprite)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Habilita multiplos toques na tela.
        self.scene?.view?.isMultipleTouchEnabled = true
        // Traz o sprite para a camada mais em cima.
        layerCount += 1
        self.zPosition = CGFloat(layerCount)
        // Quando inicia o toque reseta a variável isRotating.
        // Armazena a posicção do primeiro toque em relação com o sprite.
        if touches.count == 1{
            touchOffset.x = (touches.first?.location(in: scene!).x)! - self.position.x
            touchOffset.y = (touches.first?.location(in: scene!).y)! - self.position.y
        }
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getAngle(_ firstTouch: CGPoint,_ secondTouch: CGPoint) -> CGFloat{
        // Calcula anglo entre os dois toques por meio do arcotangente.
        let catetoOposto = secondTouch.y - firstTouch.y
        let catetoAdjacente = secondTouch.x - firstTouch.x
        let tangente = catetoOposto / catetoAdjacente
        let angulo = atan(tangente)
        return angulo
    }
}
