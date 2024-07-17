//
//  GameOverScene.swift
//  CrashCar
//
//  Created by Foundation-007 on 28/06/24.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene{
    
    var gameOverlabel: SKLabelNode!
    var restartlabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        restartlabel = self.childNode(withName: "//restartlLabel") as? SKLabelNode
        
        
        gameOverlabel = SKLabelNode(text: "GAME OVER")
        gameOverlabel.fontSize = 50
        gameOverlabel.position = .zero
        
        addChild(gameOverlabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //check which node it touched
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        
        if self.atPoint(location) == restartlabel {
            restartGame()
        }
        
    }
    
    func restartGame(){
        if let scene = SKScene(fileNamed: "GameScene"){
            scene.scaleMode = .aspectFill
            
            let transition = SKTransition.doorway(withDuration: 1)
            view?.presentScene(scene, transition: transition)
        }
    }
}
