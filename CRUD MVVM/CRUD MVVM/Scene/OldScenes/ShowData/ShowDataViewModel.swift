import Foundation
//MARK: Delegate/Protocols
protocol ShowDataViewModelDelegate: AnyObject {
    
    func onSuccessReloadData()
}

protocol ShowDataViewModelReloadDelegate: AnyObject {
    
    func updateAllRegister()
}

protocol ShowDataViewModeling {
    var delegate: ShowDataViewModelDelegate? { get set }
    
    func reloadData()
}

final class ShowDataViewModel{
    weak var delegate: ShowDataViewModelDelegate?
    
    func changeIndex(newIndex: Int) {
        editIndex = newIndex
    }
}

//MARK: - RegisterViewModeling Extension
extension ShowDataViewModel: ShowDataViewModeling {
    func reloadData() {
        delegate?.onSuccessReloadData()
    }
}
