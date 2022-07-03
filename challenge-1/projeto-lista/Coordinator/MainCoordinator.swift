import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navCon: UINavigationController
    
    public init(navCon: UINavigationController) {
        self.navCon = navCon
    }
    
    func start() {
        goToScreen(screen: .Home)
    }
    
    func goToScreen(screen: Screen) {
        switch screen {
        case .Home:
            navCon.pushViewController(ViewController(viewModel: ViewModel(coordinator: self)), animated: false)
        case .IMC:
            navCon.pushViewController(IMCViewController(viewModel: IMCViewModel(coordinator: self)), animated: true)
        case .IMCCalc(let data):
            navCon.pushViewController(CalcViewController(data: data, viewModel: CalcViewModel(coordinator: self)), animated: true)
        }
        
    }
    
    func openAlert(title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navCon.viewControllers.first?.present(alertController, animated: true, completion: nil)
    }
    
}
