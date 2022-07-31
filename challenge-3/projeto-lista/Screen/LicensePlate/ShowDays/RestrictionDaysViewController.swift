import Foundation
import UIKit

class RestrictionDaysViewController: UIViewController {
    
    var viewModel: RestrictionDaysViewModel?
    var plateData: PlateModel
    
    init(plateData: PlateModel, viewModel: RestrictionDaysViewModel) {
        self.plateData = plateData
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
        
        stackView.addArrangedSubview(plateLabel)
        stackView.addArrangedSubview(allowedDayLabel)
        return stackView
    }()
    
    private lazy var plateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = plateData.plateId
        return label
    }()
    
    private lazy var allowedDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel?.getLabel(plateId: plateData.plateId)
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
            
            self.plateLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 70),
            self.plateLabel.heightAnchor.constraint(equalToConstant: 40),
            
            self.allowedDayLabel.topAnchor.constraint(equalTo: plateLabel.topAnchor, constant: 100),
            self.allowedDayLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
