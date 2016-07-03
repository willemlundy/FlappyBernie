//
//  SpriteComponent.swift
//  FlappyBernie
//
//  Created by William Lundy on 7/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityNode: SKSpriteNode {
    weak var entity:GKEntity!
}

class SpriteComponent: GKComponent {
    
    let node: EntityNode
    
    init(entity: GKEntity, texture: SKTexture, size: CGSize) {
        node = EntityNode(texture: texture, color: SKColor.whiteColor(), size: size)
        node.entity = entity
    }
}
