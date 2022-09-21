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
    
    var counter:Int = 0
    
    var firstTouchPos:CGPoint = CGPoint(x: 0, y: 0)
    var secondTouchPos:CGPoint = CGPoint(x: 0, y: 0)
    var localAngleOffset:CGFloat = 0
    
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
        //para quando ouver dois toques
        if (self.name == "unselected" && touches.count == 1){
            // quando inicia o toque muda nome dele para selecionado.
            self.name = "simpleSelected"
            // Armazena a posicção do primeiro toque em relação com o sprite.
            touchOffset.x = self.position.x - (touches.first?.location(in: scene!).x)!
            touchOffset.y = self.position.y - (touches.first?.location(in: scene!).y)!
            touchPos = (touches.first?.location(in: self.scene!))!
        }else if (self.name == "simpleSelected" || touches.count == 2 ){
            
            // Armazena os dois toques.
            if (touches.count != 1){ // Quando ocorre dois toques simultâneos.
                for touch in touches{
                    if touch == touches.first{
                        firstTouchPos = touch.location(in: self.scene!)
                    }else{
                        secondTouchPos = touch.location(in: self.scene!)
                    }
                }
            }else if(touches.count == 1){ // Quando ocorre dois toques separadamente
                firstTouchPos = touchPos
                secondTouchPos = (touches.first?.location(in: self.scene!))!
            }
            
            localAngleOffset = getLocalAngle(firstTouchPos, secondTouchPos) - self.zRotation
            
            self.name = "doubleSelected"
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if touches.count != 1{
//            self.name = "unselected"
//        }
        if(self.name == "simpleSelected" && counter > 3){
            // Calcula os limites da cena baseado no tamanho dos objetos.
            let sceneSize = self.scene?.size
            let imageSize = self.sprite.size
            let sceneLimitWidth = sceneSize!.width/2 - imageSize.width/2 - 10
            let sceneLimitHeight = sceneSize!.height/2 - imageSize.height/2 - 10

            // Limite no eixo X.
            if (touchPos.x + touchOffset.x) < sceneLimitWidth && (touchPos.x + touchOffset.x) > (sceneLimitWidth * -1){
                self.position.x = touchPos.x + touchOffset.x
            }
            // Limite no eixo Y.
            if (touchPos.y + touchOffset.y) < sceneLimitHeight && (touchPos.y + touchOffset.y) > (sceneLimitHeight * -1){
                self.position.y = touchPos.y + touchOffset.y
            }
            // Cria as ações para mudar de textura
            let node = self.scene?.childNode(withName: "trash")
            let selectAction = SKAction.setTexture(SKTexture(imageNamed: "TrashSelected"))
            let unselectAction = SKAction.setTexture(SKTexture(imageNamed: "TrashUnselected"))
            // Muda a imagem da lixeira caso a Card esteja sobre ela.
            if (touchPos.x + touchOffset.x) > ((self.scene?.size.width)! * 0.35)  && (touchPos.y + touchOffset.y) < ((self.scene?.size.height)! * -0.35) {
                node?.run(selectAction)
            }else{
                node?.run(unselectAction)
            }
            touchPos = (touches.first?.location(in: self.scene!))!
        }
        else if(self.name == "doubleSelected"){
            if (touches.count > 1){
                for touch in touches{
                    if touch == touches.first{
                        firstTouchPos = touch.location(in: self.scene!)
                    }else{
                        secondTouchPos = touch.location(in: self.scene!)
                    }
                }
            }
            
//            print("\n\(firstTouchPos)")
//            print(secondTouchPos)
//            print(getLocalAngle(firstTouchPos, secondTouchPos) * 180 / .pi)
        }
        counter += 1
    }
    // Seta o estado da Imagem para não selecionada.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Volta a imagem do lixo ao normal.
        let node = self.scene?.childNode(withName: "trash")
        let unselectAction = SKAction.setTexture(SKTexture(imageNamed: "TrashUnselected"))
        node?.run(unselectAction)
        // Apaga o nó quando o a imagem está em cima do lixo
        if (touchPos.x + touchOffset.x) > ((self.scene?.size.width)! * 0.35)  && (touchPos.y + touchOffset.y) < ((self.scene?.size.height)! * -0.35) {
            self.removeFromParent()
        }
        
        if(self.name == "doubleSelected"){
            self.name = "simpleSelected"
        } else if(self.name == "simpleSelected"){
            self.name = "unselected"
        }
        counter = 0
        
    }
    // Seta o estado da Imagem para não selecionada.
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(self.name == "doubleSelected"){
            self.name = "simpleSelected"
        } else if(self.name == "simpleSelected"){
            self.name = "unselected"
        }
        counter = 0
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Calcula a distância entre o toque dentro da imagem e o toque passado pelo parametro.
    func getLength(_ secondTouchPos: CGPoint) -> CGFloat{
        let oposite = secondTouchPos.y - touchPos.y
        let adjacent = secondTouchPos.x - touchPos.x
        let hypotenuse = sqrt (pow( oposite, 2) + pow( adjacent, 2))
        return hypotenuse
    }
    // Calcula o angulo entre o toque dentro da imagem e toque passado pelo parametro.
    func getAngle(_ secondTouchPos: CGPoint) -> CGFloat{
        let catetoOposto = secondTouchPos.y - touchPos.y
        let catetoAdjacente = secondTouchPos.x - touchPos.x
        let tangente = catetoOposto / catetoAdjacente
        let angulo = atan(tangente)
        // Corrige o valor do angulo de acordo com o quadrante atual.
        if (secondTouchPos.x > touchPos.x && secondTouchPos.y > touchPos.y){
            return angulo
        }
        else if(secondTouchPos.x > touchPos.x && secondTouchPos.y < touchPos.y){
            return angulo + .pi * 2
        }
        else if (secondTouchPos.x < touchPos.x){
            return angulo + .pi
        }
        return CGFloat(0)
    }
    
    func getLocalAngle(_ firstTouchPos: CGPoint, _ secondTouchPos: CGPoint) -> CGFloat{
        let catetoOposto = secondTouchPos.y - firstTouchPos.y
        let catetoAdjacente = secondTouchPos.x - firstTouchPos.x
        let tangente = catetoOposto / catetoAdjacente
        let angulo = atan(tangente)
        // Corrige o valor do angulo de acordo com o quadrante atual.
        if (secondTouchPos.x > firstTouchPos.x && secondTouchPos.y > firstTouchPos.y){
            return angulo
        }
        else if(secondTouchPos.x > firstTouchPos.x && secondTouchPos.y < firstTouchPos.y){
            return angulo + .pi * 2
        }
        else if (secondTouchPos.x < firstTouchPos.x){
            return angulo + .pi
        }
        return CGFloat(0)
    }
    
    // Rotaciona a imagem.
    func rotateNode(_ secondTouchPos: CGPoint, _ angleOffset: CGFloat){
        let fingerAngle = getAngle(secondTouchPos)
        self.zRotation = fingerAngle - angleOffset
    }
    // Reposiciona a imagem.
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
    // Rescalona a imagem.
    func scaleNode(_ secondTouchPos: CGPoint, _ originalLength: CGFloat, _ originalSize: CGSize){
        let oposite = secondTouchPos.y - touchPos.y
        let adjacent = secondTouchPos.x - touchPos.x
        let hypotenuse = sqrt (pow( oposite, 2) + pow( adjacent, 2))
        let factor = hypotenuse / originalLength
        self.sprite.size.width = originalSize.width * factor
        self.sprite.size.height = originalSize.height * factor
        
    }
}
