//
//  GameScene.swift
//  FlappyBernie
//
//  Created by William Lundy on 6/28/16.
//  Copyright (c) 2016 William Lundy. All rights reserved.
//

import SpriteKit

enum Layer:CGFloat {
    case Background
    case Foreground
}

class GameScene: SKScene {
    
    let worldNode = SKNode()
    
    var playableStart: CGFloat = 0
    var playableHeight: CGFloat = 0
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        addChild(worldNode)
        setupBackground()
        setupForeground()

    }
    
    // MARK: Setup methods
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        background.position = CGPoint(x: size.width/2, y: size.height)
        
        background.zPosition = Layer.Background.rawValue
        
        worldNode.addChild(background)
        
        playableStart = size.height - background.size.height
        playableHeight = background.size.height
        
    }
    
    func setupForeground() {
        
        let foreground = SKSpriteNode(imageNamed: "Ground")
        foreground.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        foreground.position = CGPoint(x: 0, y: playableStart)
        
        foreground.zPosition = Layer.Foreground.rawValue
        
        worldNode.addChild(foreground)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
