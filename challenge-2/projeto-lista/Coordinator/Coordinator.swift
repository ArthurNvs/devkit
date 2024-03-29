import Foundation
import UIKit

enum Screen {
    case Home
    case IMC
    case IMCCalc(IMCModel)
    case LicensePlates
    case RestrictionDays(PlateModel)
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func goToScreen(screen: Screen)
}
