import Scenes

class BackgroundLayer : Layer {
    let clearRectangle : ClearRectangle

    override init() {
        clearRectangle = ClearRectangle()

        super.init()

        insert(entity:clearRectangle, at:.front)
    }
    
}
