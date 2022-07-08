protocol ViewModelDelegate: AnyObject {
    func calcSuccess(imc: Double)
    func calcFail(_ errorMessage: String)
}

protocol ViewModelType {
    func calcIMC(data: IMCModel)
    var delegate: ViewModelDelegate? { get set }
}
