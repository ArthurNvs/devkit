import Foundation
import UIKit

public class CalcViewModel: ViewModelType {
    var delegate: ViewModelDelegate?
    
    var coordinator: MainCoordinator
    
    var errorMessage: String = ""
    var successMessage: String = ""
    
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
    
    func calcIMC(data: IMCModel) {
        if data.peso == 0.0, data.altura == 0.0 {
            delegate?.calcFail("Dados inválidos")
        }
        let imc = data.peso / (data.altura * data.altura)
        delegate?.calcSuccess(imc: imc)
    }
    
    func getLabelMessage(imc: Double) -> String {
        if imc >= 18.5 && imc < 25 { return "Normal 😁" }
        if imc >= 25 && imc < 30 { return "Sobrepeso 🙁" }
        if imc >= 30 && imc < 35 { return "Obesidade classe I ☹️" }
        if imc >= 35 { return "Obesidade classe II ☹️" }
        return "Desnutrição 😵"
    }
    
}
