import Foundation

public class LicensePlateViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didTapButton(data: PlateModel) {
        coordinator.goToScreen(screen: .RestrictionDays(data))
    }
}
