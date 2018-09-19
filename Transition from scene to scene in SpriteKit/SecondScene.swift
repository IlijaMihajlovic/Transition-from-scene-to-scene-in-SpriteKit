//
//  SecondScene.swift
//  Transition from scene to scene in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/11/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import Foundation
import SpriteKit

class SecondScene: SKScene {
    
    var labelNode: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "Pacific-Again")
        label.fontSize = CGFloat.universalFont(size: 57)
        label.zPosition = 3
        label.fontColor = SKColor.white
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.text = "Second Scene"
        return label
    }()
    
    var background: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: "RedBlue")
        if DeviceType.isiPhoneX || DeviceType.isiPad || DeviceType.isiPadPro {
            sprite.scaleTo(screenHeightPercentage: 1.0)
        }
        sprite.zPosition = 1
        return sprite
    }()
    
    override func didMove(to view: SKView) {
        print("Inside Second Scene")
        setupNodes()
        addNodes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            if touch == touches.first {
                print("Going to Gameplay Scene")
                
                MyAppManager.shared.transition(self, toScene: .FirstScene, transition: SKTransition.moveIn(with: .down, duration: 0.4))
            }
        }
    }
    
    
    func setupNodes() {
        background.position = CGPoint(x: ScreenSize.width * 0.5, y: ScreenSize.height * 0.5)
        labelNode.position = CGPoint(x: ScreenSize.width * 0.5, y: ScreenSize.height * 0.8)
    }
    
    func addNodes() {
        addChild(background)
        addChild(labelNode)
    }
}




