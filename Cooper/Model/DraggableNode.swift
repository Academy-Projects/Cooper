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
        print("\(touchPos)passando pelo init")
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
        touchPos = (touches.first?.location(in: self.scene!))!
        
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
        if(self.name == "simpleSelected" && touches.count == 1){
            self.position.x = touches.first!.location(in: scene!).x + touchOffset.x
            self.position.y = touches.first!.location(in: scene!).y + touchOffset.y
            touchPos = (touches.first?.location(in: self.scene!))!
            
            print(touches.count)
        }
    }

        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getLength(_ secondTouchPos: CGPoint) -> CGFloat{
        let oposite = secondTouchPos.y - touchPos.y
        let adjacent = secondTouchPos.x - touchPos.x
        let hypotenuse = sqrt (pow( oposite, 2) + pow( adjacent, 2))
        return hypotenuse
    }
    
    func getAngle(_ secondTouchPos: CGPoint) -> CGFloat{
        let catetoOposto = secondTouchPos.y - touchPos.y
        let catetoAdjacente = secondTouchPos.x - touchPos.x
        let tangente = catetoOposto / catetoAdjacente
        let angulo = atan(tangente)
        
        if (secondTouchPos.x > touchPos.x && secondTouchPos.y > touchPos.y){
//            print("(1) = \(angulo * 180 / .pi)")
            return angulo
        }
        else if(secondTouchPos.x > touchPos.x && secondTouchPos.y < touchPos.y){
//            print("(2) = \((.pi * 2 + angulo) * 180 / .pi)")
            return angulo + .pi * 2
        }
        else if (secondTouchPos.x < touchPos.x){
//            print("(2) = \((.pi + angulo) * 180 / .pi)")
            return angulo + .pi
        }
        return CGFloat(0)
    }
    
    func rotateNode(_ secondTouchPos: CGPoint, _ angleOffset: CGFloat){
//        print(self.zRotation * (180 / .pi))
        let fingerAngle = getAngle(secondTouchPos)
        self.zRotation = fingerAngle - angleOffset
    }
    
    func positionNode(_ secondTouchPos: CGPoint, _ angleOffset: CGFloat){
        let fingerAngle = getAngle(secondTouchPos)
        var deltaAngle:CGFloat = 0
        
        deltaAngle = fingerAngle - self.zRotation - angleOffset
        
        let Nx = self.position.x
        let Ny = self.position.y
        let Tx = touchPos.x
        let Ty = touchPos.y
        
        self.position.x = (Nx * cos(deltaAngle)) - (Ny * sin(deltaAngle)) +  (Ty * sin(deltaAngle)) - (Tx * (cos(deltaAngle) - 1))
        self.position.y = (Ny * cos(deltaAngle)) + (Nx * sin(deltaAngle)) -  (Tx * sin(deltaAngle)) - (Ty * (cos(deltaAngle) - 1))
        
    }
    
    func scaleNode(_ secondTouchPos: CGPoint, _ originalLength: CGFloat){
        let oposite = secondTouchPos.y - touchPos.y
        let adjacent = secondTouchPos.x - touchPos.x
        let hypotenuse = sqrt (pow( oposite, 2) + pow( adjacent, 2))
        
        let factor = hypotenuse / originalLength
        self.setScale(factor)
    }
}
