import Foundation
import UIKit

public class CalcViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didTapButton(close: Bool) {
        if (close) {
            coordinator.goToScreen(screen: .Home)
            return
        }
        coordinator.goToScreen(screen: .IMC)
    }
    
    public func openAlert(title: String) {
        coordinator.openAlert(title: title)
    }
    
}
