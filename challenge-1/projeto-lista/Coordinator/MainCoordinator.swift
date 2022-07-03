import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navCon: UINavigationController
    
    public init(navCon: UINavigationController) {
        self.navCon = navCon
    }
    
    func start() {
        navCon.pushViewController(ViewController(viewModel: ViewModel(coordinator: self)), animated: true)
    }
    
    func goToScreen(screen: Screen) {
        navCon.pushViewController(IMCViewController(), animated: true)
    }
    
    func openAlert(title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navCon.viewControllers.first?.present(alertController, animated: true, completion: nil)
    }
    
}
