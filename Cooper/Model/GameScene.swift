//
//  DraggableNode.swift
//  Cooper
//
//  Created by Matheus Costa on 19/08/22.
//

import SwiftUI
import SpriteKit
//import Foundation

// Cria variável para o contador para o controle de layers.
public var layerCount = 0
public var angleOffset:CGFloat = 0
public var fingerLength:CGFloat = 0.1
public var originalSpriteSize: CGSize!
var backgroundColorCustom = UIColor(named: "ColorBackgroundInside")

    

class GameScene: SKScene{
    
//    let sceneSize = self().scene?.size
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        self.backgroundColor = .clear
        
        
    }
    // Função para criar um novo sprite na cena.
    public func createNewObj(image:String){
        let spriteNode = DraggableNode()
        spriteNode.name = "unselected"
        // Adiciona uma textura no objeto recem criado.
        let texture = SKTexture(imageNamed: image)
        let action = SKAction.setTexture(texture, resize: true)
        spriteNode.sprite.run(action)
        // Adiciona o SKSprite na cena.
        self.addChild(spriteNode)
    }
    
    // Função para tirar um screenshot da Ilustração para mostrar na tela de votação.
    public func takeScreenshot (scene: SKScene) -> UIImage {
        let node = scene.childNode(withName: "trash")
        let originalPos = node?.position
        
        node?.position = CGPoint(x: 1000, y: 1000)
        let texture = self.view?.texture(from: scene)
        let image = texture?.cgImage()
        node?.position = originalPos!
        
        return UIImage(cgImage: image!)
    }
    
    // Seta SKScene quando ela for carregada.
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.view?.isMultipleTouchEnabled = true
        // Adiciona a imagem do lixo.
        let TrashNode = SKSpriteNode(imageNamed: "TrashUnselected")
        TrashNode.name = "trash"
        // Define o tamanho da imagem do lixo.
        TrashNode.size.width = scene!.size.width * 0.065
        TrashNode.size.height = scene!.size.width * 0.065
        // Define a posição da imagem.
        let sceneSize = scene?.size
        let imageSize = TrashNode.self.size
        let xCord = sceneSize!.width/2 - imageSize.width/2 - sceneSize!.width * 0.038
        let yCord = sceneSize!.height * -0.5 + imageSize.height/2 + sceneSize!.height * 0.035
        
        TrashNode.position = CGPoint(x: xCord, y: yCord)
        self.addChild(TrashNode)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let Mynode:DraggableNode = (self.childNode(withName: "simpleSelected")) as? DraggableNode {
            let location = touch.location(in: self)
            angleOffset = Mynode.getAngle(location) - Mynode.zRotation
            fingerLength = Mynode.getLength(location)
            originalSpriteSize = Mynode.sprite.size
            Mynode.name = "comboSelected"
        }
    }
    // Seta o estado da Imagem para não selecionada.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.childNode(withName: "comboSelected") != nil{
            // Parar de editar quando o segundo toque for retirado.
            self.childNode(withName: "comboSelected")?.name = "unselected"
            // Continuar editando quando o segundo toque for retirado
//            self.childNode(withName: "comboSelected")?.name = "simpleSelected"
        }
    }
    // Seta o estado da Imagem para não selecionada.
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.childNode(withName: "comboSelected") != nil{
            // Parar de editar quando o segundo toque for retirado.
            self.childNode(withName: "comboSelected")?.name = "unselected"
            // Continuar editando quando o segundo toque for retirado.
//            self.childNode(withName: "comboSelected")?.name = "simpleSelected"
            
        }
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.childNode(withName: "comboSelected") != nil, let touch = touches.first{
            let Mynode:DraggableNode = (self.childNode(withName: "comboSelected")) as! DraggableNode
            let touchLocation = touch.location(in: self)
            // Posiciona a imagem em torno do toque dentro dela
            Mynode.positionNode(touchLocation, angleOffset)
            // Rotaciona a imagem de acordo com o angulo entre os toques
            Mynode.rotateNode(touchLocation, angleOffset)
            // Escalona a imagem.
            Mynode.scaleNode(touchLocation, fingerLength, originalSpriteSize)
            
        }
        
    }
    
    override func update(_ currentTime: CFTimeInterval){
    }

}
