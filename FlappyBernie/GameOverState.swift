//
//  GameOverState.swift
//  FlappyBernie
//
//  Created by William Lundy on 7/5/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOverState: GKState {
    unowned let scene: GameScene
    
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is PlayingState.Type
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
    }
}
