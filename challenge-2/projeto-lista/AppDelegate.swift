import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainCoordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navCon = UINavigationController.init()
        mainCoordinator = MainCoordinator(navCon: navCon)
        mainCoordinator?.start()
        
        window!.rootViewController = navCon
        window!.makeKeyAndVisible()
        return true
    }
    
}
