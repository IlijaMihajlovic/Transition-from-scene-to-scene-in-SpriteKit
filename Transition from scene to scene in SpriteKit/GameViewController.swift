//
//  ViewController.swift
//  Transition from scene to scene in SpriteKit
//
//  Created by Ilija Mihajlovic on 9/11/18.
//  Copyright © 2018 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewcontroller: UIViewController {
    
    //Create a SKView
    let skView: SKView = {
        let view = SKView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(skView)
        
        NSLayoutConstraint.activate([skView.topAnchor.constraint(equalTo: view.topAnchor),
            skView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     skView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     skView.leadingAnchor.constraint(equalTo: view.leadingAnchor)])
        
        
        let scene = FirstScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        scene.scaleMode = .resizeFill
        
        
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    
}
