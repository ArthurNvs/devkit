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
    
    func calcIMC(height: Double, weight: Double) -> Double {
        if (height == 0 || weight == 0) { return 0.0 }
        return weight / (height * height)
    }
    
    func setLabel(imc: Double) -> String {
        if imc >= 18.5 && imc < 25 { return "Normal 😁" }
        if imc >= 25 && imc < 30 { return "Sobrepeso 🙁" }
        if imc >= 30 && imc < 35 { return "Obesidade classe I ☹️" }
        if imc >= 35 { return "Obesidade classe II ☹️" }
        return "Desnutrição 😵"
    }
    
}
