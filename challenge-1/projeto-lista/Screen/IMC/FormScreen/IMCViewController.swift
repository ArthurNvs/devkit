import UIKit

class IMCViewController: UIViewController {
    
    var viewModel: IMCViewModel?
    
    init (viewModel: IMCViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        guard let height = Double(heightField.text!), height > 0.0, let weight = Double(weightField.text!), weight > 0.0 else {
            viewModel?.openAlert(title: "Dados inválidos")
            return
        }
        viewModel?.didTapButton(data: IMCModel(peso: weight, altura: height))
    }
    
}