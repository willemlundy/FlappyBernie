//
//  MovementComponent.swift
//  FlappyBernie
//
//  Created by William Lundy on 7/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

import SpriteKit
import GameplayKit

class MovementComponent: GKComponent {
    
    let spriteComponent: SpriteComponent
    
    var velocity = CGPoint.zero
    let gravity: CGFloat = -1500
    let impulse: CGFloat = 400
    
    var playableStart: CGFloat = 0
    
    init(entity: GKEntity) {
        self.spriteComponent = entity.componentForClass(SpriteComponent)!
    }
    
    func applyImpulse() {
        velocity = CGPoint(x: 0, y: impulse)
    }
    
    
    
    func applyMovement(seconds: NSTimeInterval) {
        
        let spriteNode = spriteComponent.node
        
        // Apply Gravity
        let gravityStep = CGPoint(x: 0, y: gravity) * CGFloat(seconds)
        velocity += gravityStep
        
        // Apply Velocity
        let velocityStep = velocity * CGFloat(seconds)
        spriteNode.position += velocityStep
        
        // Temporary ground hit
        if spriteNode.position.y - spriteNode.size.height/2 < playableStart {
            spriteNode.position = CGPoint(x: spriteNode.position.x, y: playableStart + spriteNode.size.height/2)
        }
        
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        applyMovement(seconds)
    }
    
}
