import Scenes

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

    override func wantsMouseEvents() -> MouseEventTypeSet {
        return [.drag, .downUp]
    }
    
    
}
