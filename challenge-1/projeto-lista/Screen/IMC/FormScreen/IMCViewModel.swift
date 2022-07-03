import Foundation
import UIKit

public class IMCViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didTapButton(data: IMCModel) {
        coordinator.goToScreen(screen: .IMCCalc(data))
    }
    
    public func openAlert(title: String) {
        coordinator.openAlert(title: title)
    }
    
}
