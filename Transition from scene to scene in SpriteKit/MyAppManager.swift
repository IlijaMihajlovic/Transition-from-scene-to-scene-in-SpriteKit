//
//  MyAppManager.swift
//  Transition from scene to scene in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/11/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import Foundation

import SpriteKit

class MyAppManager {
    
    enum SceneType {
        case FirstScene
        case SecondScene
    }
    
    private init() {}
    
    static let shared = MyAppManager()
    
    
    func transition(_ fromScene: SKScene, toScene: SceneType, transition: SKTransition? = nil) {
        
        guard let scene = getScene(toScene) else {
            
            print("Destination Scene not found")
            return
        }
        
        if let transition = transition {
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene, transition: transition)
        } else {
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene)
        }
    }
    
    func getScene(_ sceneType: SceneType) -> SKScene? {
        
        switch sceneType {
        case SceneType.FirstScene:
            return FirstScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
            
        case SceneType.SecondScene:
            return SecondScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        }
    }
}
