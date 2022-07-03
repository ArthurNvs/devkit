import Foundation
import UIKit

public class IMCViewModel: ScreenProtocol {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public func didTapListCell(name: String) {
        coordinator.openAlert(title: "test")
    }
    
}
