//
//  FallingState.swift
//  FlappyBernie
//
//  Created by William Lundy on 7/5/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

import SpriteKit
import GameplayKit

class FallingState: GKState {
    unowned let scene: GameScene
    
    // Game Sounds
    let whackAction = SKAction.playSoundFileNamed("whack.wav", waitForCompletion: false)
    let fallingAction = SKAction.playSoundFileNamed("falling.wav", waitForCompletion: false)
    
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        
        scene.runAction(SKAction.sequence([whackAction, SKAction.waitForDuration(0.1), fallingAction]))
        scene.stopSpawning()
        
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is GameOverState.Type
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
    }
    
}
