import Foundation
import UIKit

protocol Coordinator {
    var navCon: UINavigationController { get set }
    
    func start()
    
    func openAlert(title: String)
}
