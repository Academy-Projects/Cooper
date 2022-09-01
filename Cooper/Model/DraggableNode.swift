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
    var touchPos:CGPoint = CGPoint(x: 0, y: 0)
    
    override init() {
        self.sprite = SKSpriteNode()
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
        // quando inicia o toque muda nome dele para selecionado.
        self.name = "simpleSelected"
        // Armazena a posicção do primeiro toque em relação com o sprite.
        touchOffset.x = self.position.x - (touches.first?.location(in: scene!).x)!
        touchOffset.y = self.position.y - (touches.first?.location(in: scene!).y)!
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.name = "unselected"
        print(self.name!)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.name = "unselected"
        print(self.name!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(self.name == "simpleSelected"){
            self.position.x = touches.first!.location(in: scene!).x + touchOffset.x
            self.position.y = touches.first!.location(in: scene!).y + touchOffset.y
            touchPos = (touches.first?.location(in: self.scene!))!
        }
    }

        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getAngle(_ secondTouchPos: CGPoint) -> CGFloat{
        let catetoOposto = secondTouchPos.y - touchPos.y
        let catetoAdjacente = secondTouchPos.x - touchPos.x
        let tangente = catetoOposto / catetoAdjacente
        let angulo = atan(tangente)
        return angulo
    }
    
    func rotateNode(_ secondTouchPos: CGPoint, _ angleOffset: CGFloat){
        let fingerAngle = getAngle(secondTouchPos)
        if (secondTouchPos.x > touchPos.x){
            self.zRotation = fingerAngle - angleOffset
        }
        else if (secondTouchPos.x < touchPos.x){
            self.zRotation = fingerAngle - angleOffset + .pi
        }
    }
    
    func positionNode(_ secondTouchPos: CGPoint){
        let fingerAngle = getAngle(secondTouchPos)
        let deltaAngle = fingerAngle - self.zRotation
        
        let Nx = self.position.x
        let Ny = self.position.y
        let Tx = secondTouchPos.x
        let Ty = secondTouchPos.y
        
        self.position.x = (Nx * cos(deltaAngle)) - (Ny * sin(deltaAngle)) +  (Ty * sin(deltaAngle)) - (Tx * (cos(deltaAngle) - 1))
        self.position.y = (Ny * cos(deltaAngle)) + (Nx * sin(deltaAngle)) -  (Tx * sin(deltaAngle)) - (Tx * (cos(deltaAngle) + 1))
        
    }
}
