import Scenes
import Igis

class ClearRectangle : RenderableEntityBase {
    let rectangle = Rectangle(rect:Rect(topLeft:Point(), size:Size(width:0, height:0)), fillMode:.clear)

    override func setup(canvas:Canvas) {
        guard let canvasSize = canvas.canvasSize else {
            fatalError("canvasSize required for setup of Box")
        }
        rectangle.rect.size = canvasSize
    }
    
    override func render(canvas:Canvas) {
        canvas.render(rectangle)
    }

}
