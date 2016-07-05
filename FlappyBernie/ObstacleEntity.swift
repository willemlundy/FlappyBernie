//
//  ObstacleEntity.swift
//  FlappyBernie
//
//  Created by William Lundy on 7/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Obstacle: GKEntity {
    var spriteComponent: SpriteComponent!
    
    init(imageName: String) {
        super.init()
        
        let texture = SKTexture(imageNamed: imageName)
        spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        
        addComponent(spriteComponent)
        
        // Add Physics
        let spriteNode = spriteComponent.node
        
        spriteNode.physicsBody = SKPhysicsBody(rectangleOfSize: spriteNode.size)
        spriteNode.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        spriteNode.physicsBody?.collisionBitMask = 0
        spriteNode.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        
    }
    
    
}
