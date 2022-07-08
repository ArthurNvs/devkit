import UIKit

class IMCViewController: UIViewController {
    
    var viewModel: IMCViewModel?
    
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    init (viewModel: IMCViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightField.keyboardType = .numberPad
        weightField.keyboardType = .numberPad
        view.backgroundColor = .black
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        viewModel?.didTapButton(data: IMCModel(peso: Double(weightField.text!) ?? 0, altura: Double(heightField.text!) ?? 0))
    }
    
}
