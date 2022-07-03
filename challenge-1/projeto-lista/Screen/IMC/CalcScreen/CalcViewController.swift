import UIKit

class CalcViewController: UIViewController {
    
    var data: IMCModel?
    
    init(data: IMCModel) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        print(data)
    }

}
