import Foundation
import UIKit

public class ViewModel: ScreenProtocol {
    var coordinator: MainCoordinator
    var rowsNumber: Int {
        names.count
    }
    
    let names = ["Desafio 1", "Desafio 2", "Desafio 3"]
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    public func didTapListCell(name: String) {
        if name == "Desafio 1" {
            coordinator.goToScreen(screen: .IMC)
        }
        
        return
    }
    
}

public protocol ScreenProtocol {
    func didTapListCell(name: String)
}
