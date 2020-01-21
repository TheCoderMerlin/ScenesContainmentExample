import Scenes
import Igis

class Target : RenderableEntityBase {
    // It's generally easiest to initialize any objects as part of their declaration,
    // unless more complex calculations are required
    static let targetSize = Size(width:30, height:30)

    let outerFillStyle = FillStyle(color:Color(.red))
    let middleFillStyle = FillStyle(color:Color(.black))
    let innerFillStyle = FillStyle(color:Color(.red))

    let outerEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width, radiusY:Target.targetSize.height, fillMode:.fill)
    let middleEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width * 2 / 3, radiusY:Target.targetSize.height * 2 / 3, fillMode:.fill)
    let innerEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width * 1 / 3, radiusY:Target.targetSize.height * 1 / 3, fillMode:.fill)
    

    // The setup() method is guaranteed to be invoked exactly once per object prior
    // to calculate() and render().
    // It enables the object to perform any setup that requires a Canvas.
    override func setup(canvas:Canvas) {
        // Safely obtain the canvasSize
        guard let canvasSize = canvas.canvasSize else {
            fatalError("canvasSize required for setup of Box")
        }

        let centerX = canvasSize.width / 2
        let centerY = canvasSize.height / 2

        // Start the object off in the center
        outerEllipse.center = Point(x:centerX, y:centerY)
        alignChildren()
    }

    // The render() method is where the drawing to the canvas actually occurs.
    // Calculations should have occurred previously.
    override func render(canvas:Canvas) {
        canvas.render(outerFillStyle, outerEllipse, middleFillStyle, middleEllipse, innerFillStyle, innerEllipse)
    }

    // Implementing a separate method to align child objects is a good practice.
    // This way, any movement of the object can occur by moving the primary object only.
    func alignChildren() {
        middleEllipse.center = outerEllipse.center
        innerEllipse.center = outerEllipse.center
    }

    // The boundingRect() is used by Scenes as the initial step for hitTesting.
    // It's required to be implemented if the object desires intereaction with the mouse.
    override func boundingRect() -> Rect {
        return Rect(topLeft:Point(x:outerEllipse.center.x - outerEllipse.radiusX, y:outerEllipse.center.y - outerEllipse.radiusY),
                    size:Size(width:outerEllipse.radiusX * 2, height:outerEllipse.radiusY * 2))
                    
    }

    // For this object, we want to respond to both onMouseDrag and onMouseDown events.
    override func wantsMouseEvents() -> MouseEventTypeSet {
        return [.drag, .downUp]
    }

    // When this object is dragged, we'll move the primary object (the ellipse)
    // and then ask the children to follow.
    override func onMouseDrag(localLocation:Point, movement:Point) {
        outerEllipse.center.moveBy(offset:movement)
        alignChildren()
    }

    // When this object is clicked upon, we'll move it to the front.
    override func onMouseDown(localLocation:Point) {
        if let owner = owner {
            owner.moveZ(of:self, to:.front)
        }
    }
}
