import Foundation
import UIKit

class RestrictionDaysViewController: UIViewController {
    
    var plateData: PlateModel
    
    init(plateData: PlateModel) {
        self.plateData = plateData
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
        
        stackView.addArrangedSubview(label)
        return stackView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = plateData.plateId
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        setConstraints()
    }
    
}

private extension RestrictionDaysViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            self.label.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 100),
            self.label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 150),
            self.label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -150),
            self.label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
