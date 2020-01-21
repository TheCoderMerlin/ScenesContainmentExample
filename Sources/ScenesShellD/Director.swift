import Scenes

class Director : DirectorBase {


    // While overriding this method is optional,
    // it provides the flexibility to set the frame rate.
    // Experimenting with this value will lead to an optimal
    // experience for your users.
    override func framesPerSecond() -> Int {
        return 40
    }

    // It's required to override this function in order to provide at least one
    // scene.  It will be invoked when Scenes first starts and then whenever
    // a new scene is required.
    override func nextScene() -> Scene? {
        return MainScene()
    }

    // This function should be overridden for multi-scene presentations.
    // It is invoked after a scene completes a rendering cycle.
    // If true is returned, then nextScene() will be invoked to obtain
    // a new scene when the next rendering cycle begins
    /*
    override func shouldSceneTerminate() -> Bool {
        return false
    }
     */
    
}

