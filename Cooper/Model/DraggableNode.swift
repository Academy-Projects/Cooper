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
    
    var firstTouchPos: CGPoint = CGPoint(x: 0, y: 0)
    var secondTouchPos: CGPoint = CGPoint(x: 0, y: 0)
    var oldFirstTouchPos: CGPoint = CGPoint(x: 0, y: 0)
    var oldSecondTouchPos: CGPoint = CGPoint(x: 0, y: 0)
    
    var angleOffset: CGFloat = 0
    // Variável para verificar se o sprite está sendo rotacionado
    var isRotating:Bool = false
    
    var controle:Bool = true
    
    var touchOffset:CGPoint = CGPoint(x: 0, y: 0)
    
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
        // Quando inicia o toque reseta a variável isRotating.
        isRotating = false
        controle = true
        // Armazena a posicção do primeiro toque em relação com o sprite.
        if touches.count == 1{
            touchOffset.x = (touches.first?.location(in: scene!).x)! - self.position.x
            touchOffset.y = (touches.first?.location(in: scene!).y)! - self.position.y
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        // Decide qual o primeiro e segundo toque.
        for touch in touches{
            let scene = self.scene
            let location = touch.location(in: scene!)
            if touch == touches.first{
                firstTouchPos = location
            }else{
                secondTouchPos = location
            }
        }
        // Pega o a diferença de angulo entre o toque do usuário e o sprite.
        if touches.count == 2 && controle{
            for touch in touches{
                let scene = self.scene
                let location = touch.location(in: scene!)
                if touch == touches.first{
                    oldFirstTouchPos = location
                }else{
                    oldSecondTouchPos = location
                }
            }
            // Calcula anglo entre os dois toques.
            angleOffset = getAngle(oldFirstTouchPos, secondTouchPos) - self.zRotation
            controle = false
        }
        // Se o numero de toque for maior que um, rotaciona o sprite.
        if touches.count != 1{
            // Acha o ponto médio entre os dois toques.
            let xCord = (firstTouchPos.x + secondTouchPos.x)/2
            let yCord = (firstTouchPos.y + secondTouchPos.y)/2
            // Move o sprite para o ponto médio dos dois toques.
            self.position = CGPoint(x: xCord, y: yCord)

            // Adiciona o angulo necessário no angulo do sprite.

            if (secondTouchPos.x > firstTouchPos.x){
                self.zRotation = (getAngle(firstTouchPos, secondTouchPos) - angleOffset)
            }
            else if (secondTouchPos.x < firstTouchPos.x){
                self.zRotation = (getAngle(firstTouchPos, secondTouchPos) + .pi - angleOffset)
            }
//            self.setScale(hipotenusa / 320)
            // Se o sprite tá rotacionando não deixa ele ir para o firstTouchPos
            isRotating = true
            
        }else if (touches.count == 1 && isRotating == false) {
            // Move o sprite para a posição do dedo, levando em conta o touchOffset.
            self.position = CGPoint(x: (firstTouchPos.x - touchOffset.x), y: (firstTouchPos.y - touchOffset.y))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
        
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
