import Scenes

class Director : DirectorBase {

    
    required init() {
    }

    override func framesPerSecond() -> Int {
        return 40
    }
    
    override func nextScene() -> Scene? {
        return MainScene()
    }
    
}

