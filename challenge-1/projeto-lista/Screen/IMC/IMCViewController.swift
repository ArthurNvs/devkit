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
    
    func calcIMC() -> Double {
        guard let height = Double(heightField.text!), height > 0.0, let weight = Double(weightField.text!), weight > 0.0 else { return 0.0 }
        return weight / (height * height)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let imc = calcIMC()
        
        if (imc == 0.0) {
            viewModel?.openAlert(title: "Dados inválidos")
            return
        }
        
        viewModel?.openAlert(title: "\(imc)")
        viewModel?.didTapButton(imc: imc)
    }
    
}
