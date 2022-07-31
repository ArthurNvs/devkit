import UIKit

class CalcViewController: UIViewController {
    
    var data: IMCModel?
    var viewModel: CalcViewModel?
    var imc: Double = 0.0
    
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    init(data: IMCModel, viewModel: CalcViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        viewModel?.delegate = self
        configLabel()
    }
    
    func configLabel() {
        guard let imcData = data else { return }
        viewModel?.calcIMC(data: imcData)
        imcLabel.text = imc == 0 ? viewModel?.errorMessage: viewModel?.successMessage
        statusLabel.text = viewModel?.getLabelMessage(imc: self.imc) ?? viewModel?.errorMessage
    }

    @IBAction func didTapCalcButton(_ sender: Any) {
        viewModel?.didTapButton(close: false)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        viewModel?.didTapButton(close: true)
    }
}

extension CalcViewController: ViewModelDelegate {
    func calcSuccess(imc: Double) {
        self.imc = imc
        viewModel?.successMessage = "Seu IMC é de \(String(format: "%.2f", imc))"
    }
    
    func calcFail(_ errorMessage: String) {
        viewModel?.errorMessage = errorMessage
    }
    
}
