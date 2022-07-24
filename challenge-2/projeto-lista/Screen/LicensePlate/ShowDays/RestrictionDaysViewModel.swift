import Foundation

public class RestrictionDaysViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func getLabel(plateId: String) -> String {
        guard let plateEnd = plateId[6].wholeNumberValue else { return "Error" }
        
        switch plateEnd {
            case 1...2 : return getDayValidation(restrictionDay: 2)
            case 3...4: return getDayValidation(restrictionDay: 3)
            case 5...6: return getDayValidation(restrictionDay: 4)
            case 7...8: return getDayValidation(restrictionDay: 5)
            case 9: return getDayValidation(restrictionDay: 6)
            case 0: return getDayValidation(restrictionDay: 6)
            default: return "Erro ao validar data"
        }
    }
    
    func getDayValidation(restrictionDay: Int) -> String {
        let today = Calendar.current.component(.weekday, from: Date())
        
        if (restrictionDay > today) {
            switch restrictionDay - today {
            case 1: return "Restrição amanhã!"
            case 2: return "Restrição em 2 dias!"
            case 3: return "Restrição em 3 dias!"
            case 4: return "Restrição em 4 dias!"
            case 5: return "Restrição em 5 dias!"
            case 6: return "Restrição em 6 dias!"
            default: return "Erro ao validar data"
            }
        }
        
        if (restrictionDay < today) {
            switch today - restrictionDay {
            case 1: return "Restrição em 6 dias!"
            case 2: return "Restrição em 5 dias!"
            case 3: return "Restrição em 4 dias!"
            case 4: return "Restrição em 3 dias!"
            case 5: return "Restrição em 2 dias!"
            case 6: return "Restrição amanhã!"
            default: return "Erro ao validar data"
            }
        }
        
        return "Hoje seu carro está proibido de rodar!"
    }    
}
