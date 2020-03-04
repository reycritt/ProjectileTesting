//
//  GameScene.swift
//  ProjectileTesting
//
//  Created by cory on 3/2/20.
//  Copyright © 2020 royalty. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var doodle: SKSpriteNode!
    private var back: SKSpriteNode!
    private var gameTimer: Timer!
    
    override func didMove(to view: SKView) {
        back = SKSpriteNode(imageNamed: "Menu Background")
        back.position = CGPoint(x: 0, y: 0)
        self.addChild(back)
        back.zPosition = 0
        
        doodle = SKSpriteNode(imageNamed: "projectile_1")
        doodle.position = CGPoint(x: 0, y: 0)
        self.addChild(doodle)
        doodle.zPosition = 1
        
        gameTimer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(moving), userInfo: nil, repeats: true)
    }
    
    @objc func moving() {
        doodle = SKSpriteNode(imageNamed: "projectile_1")
        doodle.position = CGPoint(x: 0, y: 0)
        self.addChild(doodle)
        doodle.zPosition = 1
        
        print("Created")
        let random = Int.random(in: -300 ..< 300)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: random, y: 700))
        path.addLine(to: CGPoint(x: random, y: -600))
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 50)
        
        doodle.run(move)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //guard let touch = touches.first else {return}
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            if doodle.contains(touchLocation) {
                doodle.removeFromParent()
                print("Doodle broken")
            }
        }
        print("-----------------------------")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
