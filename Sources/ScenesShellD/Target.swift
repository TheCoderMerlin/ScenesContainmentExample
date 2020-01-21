import Scenes
import Igis

class Target : RenderableEntityBase {
    static let targetSize = Size(width:30, height:30)

    let outerFillStyle = FillStyle(color:Color(.red))
    let middleFillStyle = FillStyle(color:Color(.black))
    let innerFillStyle = FillStyle(color:Color(.red))

    let outerEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width, radiusY:Target.targetSize.height, fillMode:.fill)
    let middleEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width * 2 / 3, radiusY:Target.targetSize.height * 2 / 3, fillMode:.fill)
    let innerEllipse = Ellipse(center:Point(), radiusX:Target.targetSize.width * 1 / 3, radiusY:Target.targetSize.height * 1 / 3, fillMode:.fill)
    

    override func setup(canvas:Canvas) {
        guard let canvasSize = canvas.canvasSize else {
            fatalError("canvasSize required for setup of Box")
        }

        let centerX = canvasSize.width / 2
        let centerY = canvasSize.height / 2

        outerEllipse.center = Point(x:centerX, y:centerY)
        alignChildren()
    }

    override func render(canvas:Canvas) {
        canvas.render(outerFillStyle, outerEllipse, middleFillStyle, middleEllipse, innerFillStyle, innerEllipse)
    }

    func alignChildren() {
        middleEllipse.center = outerEllipse.center
        innerEllipse.center = outerEllipse.center
    }

    override func boundingRect() -> Rect {
        return Rect(topLeft:Point(x:outerEllipse.center.x - outerEllipse.radiusX, y:outerEllipse.center.y - outerEllipse.radiusY),
                    size:Size(width:outerEllipse.radiusX * 2, height:outerEllipse.radiusY * 2))
                    
    }

    override func wantsMouseEvents() -> MouseEventTypeSet {
        return [.drag, .downUp]
    }

    override func onMouseDrag(localLocation:Point, movement:Point) {
        outerEllipse.center.moveBy(offset:movement)
        alignChildren()
    }
    
    override func onMouseDown(localLocation:Point) {
        if let owner = owner {
            owner.moveZ(of:self, to:.front)
        }
    }
}
