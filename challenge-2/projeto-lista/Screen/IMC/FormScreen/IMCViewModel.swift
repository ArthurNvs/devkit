import Foundation
import UIKit

public class IMCViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didTapButton(data: IMCModel) {
        if(data.altura <= 0 || data.peso <= 0){
            coordinator.openAlert(title: "Dados inválidos")
            return
        }
        coordinator.goToScreen(screen: .IMCCalc(data))
    }
    
    public func openAlert(title: String) {
        coordinator.openAlert(title: title)
    }
    
}
