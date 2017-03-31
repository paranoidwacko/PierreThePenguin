import SpriteKit

class Ground: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "ground")
    var groundTexture: SKTexture?
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.anchorPoint = CGPoint(x: 0, y: 1)
        if groundTexture == nil {
            groundTexture = textureAtlas.textureNamed("ice-tile")
        }
        createChildren()
    }
    
    func createChildren() {
        if let texture = groundTexture {
            var tileCount: CGFloat = 0
            let textureSize = texture.size()
            let tileSize = CGSize(width: textureSize.width / 2, height: textureSize.height / 2)
            
            while tileCount * tileSize.width < self.size.width {
                let tileNode = SKSpriteNode(texture: texture)
                tileNode.size  = tileSize
                tileNode.position.x = tileCount * tileSize.width
                tileNode.anchorPoint = CGPoint(x: 0, y: 1)
                self.addChild(tileNode)
                tileCount += 1
            }
        }
    }
    
    func onTap() {}
}
