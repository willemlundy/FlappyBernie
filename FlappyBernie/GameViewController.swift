//
//  GameViewController.swift
//  FlappyBernie
//
//  Created by William Lundy on 6/28/16.
//  Copyright (c) 2016 William Lundy. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let skView = self.view as? SKView {
            if skView.scene == nil {
                
                // Create the scene
                let aspectRatio = skView.bounds.size.height / skView.bounds.size.width
                let scene = GameScene(size:CGSize(width: 320, height: 320 * aspectRatio))
                
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.showsPhysics = true
                skView.ignoresSiblingOrder = true
                
                scene.scaleMode = .AspectFill
                skView.presentScene(scene)
                
            }
        }
    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
