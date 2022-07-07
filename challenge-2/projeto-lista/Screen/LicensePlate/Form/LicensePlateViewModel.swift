import Foundation

public class LicensePlateViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didTapButton(data: PlateModel) {
        if validatePlate(plateId: data.plateId) {
            coordinator.goToScreen(screen: .RestrictionDays(data))
        }
    }
    
    func validatePlate(plateId: String) -> Bool {
        if plateId.isEmpty || plateId.count != 7 || Int(plateId) != nil {
            coordinator.openAlert(title: "Insira uma numeração válida")
            return false
        }
        
        return true
    }
}
