import Foundation
import UIKit

enum Screen {
    case Home
    case IMC
    case IMCCalc(IMCModel)
    case LicensePlates
}

protocol Coordinator {
    var navCon: UINavigationController { get set }
    
    func start()
    
    func goToScreen(screen: Screen)
}
