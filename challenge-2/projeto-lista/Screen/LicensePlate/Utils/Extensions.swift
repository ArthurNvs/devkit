import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

enum RegexType {
    case validPlate
    
    fileprivate var pattern: String {
        switch self {
        case .validPlate:
            return #"[A-Z]{3}[0-9][0-9A-Z][0-9]{2}"#
        }
    }
}

extension String {
    
    func isValidWith(regexType: RegexType) -> Bool {
        let pattern = regexType.pattern
        guard let gRegex = try? NSRegularExpression(pattern: pattern) else { return false }
        let range = NSRange(location: 0, length: self.utf16.count)
        if gRegex.firstMatch(in: self, options: [], range: range) != nil { return true }
        return false
    }
}
