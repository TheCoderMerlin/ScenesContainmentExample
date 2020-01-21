import Scenes

// The interaction layer is generally the layer (or one of the layers)
// that the user interacts with.
class InteractionLayer : Layer {
    let reference : Box
    let target : Target

    override init() {
        reference = Box()
        target = Target()

        super.init()

        insert(entity:reference, at:.front)
        insert(entity:target, at:.front)
    }

    // Remember to override this function if mouse events are desired.
    override func wantsMouseEvents() -> MouseEventTypeSet {
        return [.drag, .downUp]
    }
    
    
}
