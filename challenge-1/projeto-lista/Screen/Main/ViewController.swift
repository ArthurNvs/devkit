import UIKit

class ViewController: UIViewController {
    
    public var viewModel: ViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    init(viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableViewConfig()
    }
    
    public func tableViewConfig() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return viewModel?.rowsNumber ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let names = viewModel?.names else { return }
        viewModel?.didTapListCell(name: "\(names[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.label.text = viewModel?.names[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
