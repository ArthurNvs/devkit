import UIKit

class ViewController: UITableViewController {
    public var vmFactory: ViewModel?

    init(viewModel: ViewModel) {
        self.vmFactory = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { "Nomes" }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vmFactory?.rowsNumber ?? 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let names = vmFactory?.names else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Names", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let names = vmFactory?.names else { return }
        vmFactory?.didTapListCell(name: "\(names[indexPath.row])")
    }
    
}

extension ViewController {
    
    static func makeViewController(coordinator: MainCoordinator) -> ViewController {
        let vc = ViewController.instance()
        vc.vmFactory = ViewModel(coordinator: coordinator)
        return vc
    }
    
    public static func instance() -> Self {
        let vcName = String(describing: self)
        let sbName = "Main"
        let bundle = Bundle(for: Self.self)
        let sb = UIStoryboard(name: sbName, bundle: bundle)
        return sb.instantiateViewController(identifier: vcName) as! Self
    }
    
}
