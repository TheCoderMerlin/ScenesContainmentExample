import Scenes


// The background layer should, at minimum, clear the background
// Additional non-interactive items may be added
// This layer will generally not want mouse events
class BackgroundLayer : Layer {
    let clearRectangle : ClearRectangle

    override init() {
        // Add any desired renerable entities
        clearRectangle = ClearRectangle()

        super.init()

        // Insert the entities in order, just as is done in a Scene for Layers
        insert(entity:clearRectangle, at:.front)
    }
    
}
