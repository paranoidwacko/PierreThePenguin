import SpriteKit

class Bee: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "enemies")
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 28, height: 24)) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.run(createAnimations())
    }
    
    func createAnimations() -> SKAction {
        let flyFrames: [SKTexture] = [textureAtlas.textureNamed("bee"), textureAtlas.textureNamed("bee-fly")]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        return SKAction.repeatForever(flyAction)
    }
    
    func onTap() {}
}
