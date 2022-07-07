import Foundation
import UIKit

class LicensePlateViewController: UIViewController {
    
    var viewModel: LicensePlateViewModel
    
    init(viewModel: LicensePlateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(plateTextField)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    private lazy var plateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Insira a placa", attributes: [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.boldSystemFont(ofSize: 13),
        ])
        textField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapButton() {
        guard let plateId = plateTextField.text else { return }
        viewModel.didTapButton(data: PlateModel(plateId: plateId))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        plateTextField.addTarget(self, action: #selector(checkMaxLength(textField:)), for: .editingChanged)
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        setConstraints()
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        if (textField.text?.count ?? 0 > 7) {
            textField.deleteBackward()
        }
    }
    
}

private extension LicensePlateViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            self.plateTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            self.plateTextField.heightAnchor.constraint(equalToConstant: 40),
            self.plateTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            self.button.heightAnchor.constraint(equalToConstant: 40),
            self.button.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -230)
        ])
    }
}
