import UIKit

class CalcViewController: UIViewController {
    
    var data: IMCModel?
    var viewModel: CalcViewModel?
    
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
        configLabel()
    }
    
    func getIMC() -> Double {
        guard let imcData = data, data?.peso != 0.0, data?.altura != 0.0 else { return 0.0 }
        return viewModel?.calcIMC(height: imcData.altura, weight: imcData.peso) ?? 0
    }
    
    func configLabel() {
        imcLabel.text = getIMC() == 0 ? "Erro ao calcular IMC": "Seu IMC é de \(String(format: "%.2f", getIMC()))"
        statusLabel.text = viewModel?.setLabel(imc: getIMC()) ?? "Erro ao tratar os dados"
    }

    @IBAction func didTapCalcButton(_ sender: Any) {
        viewModel?.didTapButton(close: false)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        viewModel?.didTapButton(close: true)
    }
}
