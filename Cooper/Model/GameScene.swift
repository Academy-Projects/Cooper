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

class GameScene: SKScene{
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .white
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
        let texture = self.view?.texture(from: scene)
        let image = texture?.cgImage()
        return UIImage(cgImage: image!)
    }
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.view?.isMultipleTouchEnabled = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let Mynode:DraggableNode = (self.childNode(withName: "simpleSelected")) as? DraggableNode {
            let location = touch.location(in: self)
            angleOffset = Mynode.getAngle(location) - Mynode.zRotation
            fingerLength = Mynode.getLength(location)
            Mynode.name = "comboSelected"
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.childNode(withName: "comboSelected") != nil{
            self.childNode(withName: "comboSelected")?.name = "unselected"
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.childNode(withName: "comboSelected") != nil{
            self.childNode(withName: "comboSelected")?.name = "unselected"
        }
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        var myNode:DraggableNode = self.childNode(withName: "MyNode") as! DraggableNode
//        print(myNode.getAngle(CGPoint(x: 0, y: 100), CGPoint(x: 100, y: 0)))
        if self.childNode(withName: "comboSelected") != nil, let touch = touches.first{
            let Mynode:DraggableNode = (self.childNode(withName: "comboSelected")) as! DraggableNode
            let touchLocation = touch.location(in: self)
            Mynode.positionNode(touchLocation, angleOffset)
            Mynode.rotateNode(touchLocation, angleOffset)
            Mynode.scaleNode(touchLocation, fingerLength)
        }
        
    }
    
    override func update(_ currentTime: CFTimeInterval){
    }

}
