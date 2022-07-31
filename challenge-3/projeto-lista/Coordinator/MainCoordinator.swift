import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    public init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        goToScreen(screen: .Home)
    }
    
    func goToScreen(screen: Screen) {
        switch screen {
        case .Home:
            navigationController.pushViewController(ViewController(viewModel: ViewModel(coordinator: self)), animated: false)
        case .IMC:
            navigationController.pushViewController(IMCViewController(viewModel: IMCViewModel(coordinator: self)), animated: true)
        case .IMCCalc(let data):
            navigationController.pushViewController(CalcViewController(data: data, viewModel: CalcViewModel(coordinator: self)), animated: true)
        case .LicensePlates:
            navigationController.pushViewController(LicensePlateViewController(viewModel: LicensePlateViewModel(coordinator: self)), animated: true)
        case .RestrictionDays(let data):
            navigationController.pushViewController(RestrictionDaysViewController(plateData: data, viewModel: RestrictionDaysViewModel(coordinator: self)), animated: true)
        }
    }
    
    func openAlert(title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navigationController.viewControllers.first?.present(alertController, animated: true, completion: nil)
    }
    
}
