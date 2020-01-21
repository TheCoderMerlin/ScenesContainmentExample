import Scenes

class MainScene : Scene {
    let backgroundLayer : Layer
    let interactionLayer : Layer

    override init() {
        backgroundLayer = BackgroundLayer()
        interactionLayer = InteractionLayer()

        super.init()

        insert(layer:backgroundLayer, at:.front)
        insert(layer:interactionLayer, at:.front)
    }

    override func wantsMouseEvents() -> MouseEventTypeSet {
        return [.drag, .downUp]
    }
    
}
