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
    case Player
}

class GameScene: SKScene {
    
    let worldNode = SKNode()
    
    var playableStart: CGFloat = 0
    var playableHeight: CGFloat = 0
    
    let numberOfForegrounds = 2
    let groundSpeed: CGFloat = 150
    
    var deltaTime: NSTimeInterval = 0
    var lastUpdateTimeInterval: NSTimeInterval = 0
    
    let player = Player(imageName: "Bird0")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        addChild(worldNode)
        setupBackground()
        setupForeground()
        setupPlayer()

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
        
        for i in 0..<numberOfForegrounds {
            let foreground = SKSpriteNode(imageNamed: "Ground")
            foreground.anchorPoint = CGPoint(x: 0.0, y: 1.0)
            foreground.position = CGPoint(x: CGFloat(i) * size.width, y: playableStart)
            
            foreground.zPosition = Layer.Foreground.rawValue
            foreground.name = "foreground"
            
            worldNode.addChild(foreground)
        }
        
    }
    
    func setupPlayer() {
        let playerNode = player.spriteComponent.node
        playerNode.position = CGPoint(x: size.width * 0.2, y: playableHeight * 0.4 + playableStart)
        
        playerNode.zPosition = Layer.Player.rawValue
        
        worldNode.addChild(playerNode)
        
        player.movementComponent.playableStart = playableStart
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        player.movementComponent.applyImpulse()

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if lastUpdateTimeInterval == 0 {
            lastUpdateTimeInterval = currentTime
        }
        
        deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        // Begin Updates
        updateForeground()
        
        // Per-Entity updates
        player.updateWithDeltaTime(deltaTime)
    }
    
    func updateForeground() {
        worldNode.enumerateChildNodesWithName("foreground",
            usingBlock: { node, stop in
                if let foreground = node as? SKSpriteNode {
                    
                    let moveAmount = CGPoint(x: -self.groundSpeed * CGFloat(self.deltaTime), y: 0)
                    foreground.position += moveAmount
                    
                    if foreground.position.x < -foreground.size.width {
                        foreground.position += CGPoint(x: foreground.size.width * CGFloat(self.numberOfForegrounds), y: 0)
                    }
                }
        
        })
    }
}
