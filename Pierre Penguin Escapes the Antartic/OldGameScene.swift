//
//  GameScene.swift
//  Pierre Penguin Escapes the Antartic
//
//  Created by JH on 2/19/17.
//  Copyright © 2017 Sparrowhawk. All rights reserved.
//

import SpriteKit

class OldGameScene: SKScene {
    let world = SKNode()
    let bee = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        self.addChild(world)
        
        self.addTheFlyingBee()
        
        //        self.anchorPoint = .zero
        
        
        
        //        let bee = SKSpriteNode()
        //        bee.position = CGPoint(x: 250, y: 250)
        //        bee.size = CGSize(width: 28, height: 24)
        //        self.addChild(bee)
        
        ////        let beeAtlas = SKTextureAtlas(named: "  Enemies")
        //        let texture1 = SKTexture(cgImage: #imageLiteral(resourceName: "bee").cgImage!)
        //        let texture2 = SKTexture(cgImage: #imageLiteral(resourceName: "bee-fly").cgImage!)
        ////        let beeFrames: [SKTexture] = [
        ////            beeAtlas.textureNamed("bee"),
        ////            beeAtlas.textureNamed("bee-fly")]
        ////        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        //        let flyAction = SKAction.animate(with: [texture1, texture2], timePerFrame: 0.14)
        //        let beeAction = SKAction.repeatForever(flyAction)
        //        bee.run(beeAction)
        //
        //        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        //        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        //        let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
        //        let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
        //        let flightOfTheBee = SKAction.sequence([pathLeft, flipTextureNegative, pathRight, flipTexturePositive])
        //        let neverEndingFlight = SKAction.repeatForever(flightOfTheBee)
        //        bee.run(neverEndingFlight)
        
        // Chapter 2
        //        let mySprite = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 50))
        //        mySprite.position = CGPoint(x: 300, y: 300)
        //        self.addChild(mySprite)
        
        ////        let demoAction = SKAction.move(to: CGPoint(x: 100, y:100), duration: 5)
        ////        let demoAction = SKAction.scale(to: 4, duration: 5)
        ////        mySprite.run(demoAction)
        
        //        let demoAction1 = SKAction.scale(to: 4, duration: 2)
        //        let demoAction2 = SKAction.rotate(byAngle: 5, duration: 2)
        ////        let actionGroup = SKAction.group([demoAction1, demoAction2])
        ////        mySprite.run(actionGroup)
        //        let actionSequence = SKAction.sequence([demoAction1, demoAction2])
        ////        mySprite.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //        mySprite.run(actionSequence)
        
    }
    
    func addTheFlyingBee() {
        bee.position = CGPoint(x: 250, y: 250)
        bee.size = CGSize(width: 28, height: 24)
        world.addChild(bee)
        
        let beeAtlas = SKTextureAtlas(named:"enemies")
        let beeFrames:[SKTexture] = [
            beeAtlas.textureNamed("bee"),
            beeAtlas.textureNamed("bee-fly")]
        let flyAction = SKAction.animate(with: beeFrames,
                                         timePerFrame: 0.14)
        let beeAction = SKAction.repeatForever(flyAction)
        bee.run(beeAction)
        
        //        let texture1 = SKTexture(cgImage: #imageLiteral(resourceName: "bee").cgImage!)
        //        let texture2 = SKTexture(cgImage: #imageLiteral(resourceName: "bee-fly").cgImage!)
        //        let flyAction = SKAction.animate(with: [texture1, texture2], timePerFrame: 0.14)
        //        let beeAction = SKAction.repeatForever(flyAction)
        //        bee.run(beeAction)
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
        let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
        let flightOfTheBee = SKAction.sequence([pathLeft, flipTextureNegative, pathRight, flipTexturePositive])
        let neverEndingFlight = SKAction.repeatForever(flightOfTheBee)
        bee.run(neverEndingFlight)
    }
    
    override func didSimulatePhysics() {
        let worldXPos = -(bee.position.x * world.xScale - (self.size.width / 2))
        let worldYPos = -(bee.position.y * world.yScale - (self.size.width / 2))
        world.position = CGPoint(x: worldXPos, y: worldYPos)
    }
}
