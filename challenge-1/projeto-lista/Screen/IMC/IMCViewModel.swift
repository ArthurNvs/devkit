import Foundation
import UIKit

public class IMCViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public func didTapButton(imc: Double) {
        coordinator.goToScreen(screen: .Home)
    }
    
    public func openAlert(title: String) {
        coordinator.openAlert(title: title)
    }
    
}
