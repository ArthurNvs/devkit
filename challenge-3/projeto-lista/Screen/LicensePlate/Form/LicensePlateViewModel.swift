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
        if plateId.isEmpty || plateId.count != 7 || Int(plateId) != nil || !isValidPlateType(plateId: plateId) {
            coordinator.openAlert(title: "Insira uma numeração válida")
            return false
        }
        return true
    }
    
    func isValidPlateType(plateId: String) -> Bool {
        if (plateId.isValidWith(regexType: .validPlate)) { return true }
        return false
    }
    
}
