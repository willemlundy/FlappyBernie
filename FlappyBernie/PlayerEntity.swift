//
//  PlayerEntity.swift
//  FlappyBernie
//
//  Created by William Lundy on 7/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player: GKEntity {
    
    var spriteComponent: SpriteComponent!
    var movementComponent: MovementComponent!
    
    
    init(imageName: String) {
        super.init()
        
        let texture = SKTexture(imageNamed: imageName)
        
        spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        addComponent(spriteComponent)
        
        movementComponent = MovementComponent(entity: self)
        addComponent(movementComponent)
        
        let spriteNode = spriteComponent.node
        
        let offsetX = spriteNode.frame.size.width * spriteNode.anchorPoint.x
        let offsetY = spriteNode.frame.size.height * spriteNode.anchorPoint.y
        
        let path = CGPathCreateMutable();
        
        CGPathMoveToPoint(path, nil, 23 - offsetX, 29 - offsetY);
        CGPathAddLineToPoint(path, nil, 18 - offsetX, 23 - offsetY);
        CGPathAddLineToPoint(path, nil, 14 - offsetX, 23 - offsetY);
        CGPathAddLineToPoint(path, nil, 14 - offsetX, 21 - offsetY);
        CGPathAddLineToPoint(path, nil, 2 - offsetX, 22 - offsetY);
        CGPathAddLineToPoint(path, nil, 0 - offsetX, 17 - offsetY);
        CGPathAddLineToPoint(path, nil, 0 - offsetX, 11 - offsetY);
        CGPathAddLineToPoint(path, nil, 2 - offsetX, 5 - offsetY);
        CGPathAddLineToPoint(path, nil, 8 - offsetX, 0 - offsetY);
        CGPathAddLineToPoint(path, nil, 23 - offsetX, 0 - offsetY);
        CGPathAddLineToPoint(path, nil, 34 - offsetX, 3 - offsetY);
        CGPathAddLineToPoint(path, nil, 39 - offsetX, 10 - offsetY);
        CGPathAddLineToPoint(path, nil, 39 - offsetX, 23 - offsetY);
        CGPathAddLineToPoint(path, nil, 35 - offsetX, 29 - offsetY);
        
        CGPathCloseSubpath(path);
        
        spriteNode.physicsBody = SKPhysicsBody(polygonFromPath: path)
        spriteNode.physicsBody?.categoryBitMask = PhysicsCategory.Player
        spriteNode.physicsBody?.collisionBitMask = 0
        spriteNode.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle | PhysicsCategory.Ground
        
        
    }
}
