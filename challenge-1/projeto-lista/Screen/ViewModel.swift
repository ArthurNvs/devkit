import Foundation
import UIKit

public class ViewModel: ScreenProtocol {
    var coordinator: MainCoordinator
    var rowsNumber: Int {
        names.count
    }
    
    let names = ["Arthur", "Rodrigo", "Bruno", "Jorge", "Camila", "Daniel", "Carolina", "Matheus", "Catarina", "Silvana"]
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public func didTapListCell(name: String) {
        coordinator.openAlert(title: name)
    }
    
}

public protocol ScreenProtocol {
    func didTapListCell(name: String)
}
