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

class GameScene: SKScene{
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = .white
    }
    // Função para criar um novo sprite na cena.
    public func createNewObj(image:String){
        let spriteNode = DraggableNode()
        spriteNode.name = "MyNode"
        // Adiciona uma textura no objeto recem criado.
//        let texture = SKTexture(imageNamed: image)
//        let action = SKAction.setTexture(texture, resize: true)
//        spriteNode.sprite.run(action)
        // Adiciona o SKSprite na cena.
        spriteNode.isUserInteractionEnabled = true
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
//        if let touch = touches.first {
//            let location = touch.location(in: self)
//
//            let touchedNodes = self.nodes(at: location)
//            for node in touchedNodes.reversed() {
//                print(node)
//            }
//        }
        self.childNode(withName: "simpleSelected")?.name = "combSelected"
        print(self.nodes(at: CGPoint(x: 0, y: 0)))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.childNode(withName: "combSelected")?.name = "simpleSelected"
        print(self.nodes(at: CGPoint(x: 0, y: 0)))
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.childNode(withName: "combSelected")?.name = "simpleSelected"
        print(self.nodes(at: CGPoint(x: 0, y: 0)))
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        var myNode:DraggableNode = self.childNode(withName: "MyNode") as! DraggableNode
//        print(myNode.getAngle(CGPoint(x: 0, y: 100), CGPoint(x: 100, y: 0)))
    }
    
    override func update(_ currentTime: CFTimeInterval){
    }

}
