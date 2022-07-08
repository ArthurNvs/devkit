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
        if (plateId[0].isLetter && plateId[1].isLetter && plateId[2].isLetter) {
            if (plateId[3].isNumber && plateId[4].isNumber && plateId[5].isNumber && plateId[6].isNumber) {
                print("placa antiga")
                return true
            }
            if (plateId[3].isNumber && plateId[4].isLetter && plateId[5].isNumber && plateId[6].isNumber) {
                print("placa nova")
                return true
            }
        }
        return false
    }
    
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
