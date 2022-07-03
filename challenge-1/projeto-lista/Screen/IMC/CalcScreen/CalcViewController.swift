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
    
        imcLabel.text = "Seu IMC é de \(String(format: "%.2f", calcIMC()))"
        statusLabel.text = setStatusLabel()
    }
    
    func calcIMC() -> Double {
        guard let imcData = data, data?.peso != 0.0, data?.altura != 0.0 else { return 0.0 }
        return imcData.peso / (imcData.altura * imcData.altura)
    }
    
    func setStatusLabel() -> String {
        if calcIMC() >= 26 { return "🙁" }
        if calcIMC() < 26 && calcIMC() >= 20 { return "😁" }
        return "🧐"
    }

    @IBAction func didTapCalcButton(_ sender: Any) {
        viewModel?.didTapButton(close: false)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        viewModel?.didTapButton(close: true)
    }
}
