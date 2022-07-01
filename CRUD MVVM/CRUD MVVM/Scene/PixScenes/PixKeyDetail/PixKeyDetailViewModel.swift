import Foundation
protocol PixKeyDetailViewModelDelegate: AnyObject {
    func onSuccessDismiss()
    
    func displayAlert(title: String, message: String)
}

protocol PixKeyDetailViewModeling {
    var delegate: PixKeyDetailViewModelDelegate? { get set }
    var reloadDelegate: MyKeysViewModelReloadDelegate? { get }
    
    func reloadUpdateAllPixKeys()
    func dismissView()
    
    func displayAlert(title: String, message: String)
}

final class PixKeyDetailViewModel {

    weak var delegate: PixKeyDetailViewModelDelegate?
    weak var reloadDelegate: MyKeysViewModelReloadDelegate?
    
    init(reloadDelegate: MyKeysViewModelReloadDelegate? = nil) {
        self.reloadDelegate = reloadDelegate
    }
    
    var pixKeyType = ""
    var pixKey = ""
    
    var updatePix: Pix = allPix[loginIndex]
    
    func verifyPixKey(){
        if editPixIndex == 0 {
            pixKeyType = "CPF"
            pixKey = allPix[loginIndex].cpfKey
        }
        if editPixIndex == 1 {
            pixKeyType = "Chave aleatória"
            pixKey = allPix[loginIndex].randomKey
        }
        if editPixIndex == 2 {
            pixKeyType = "Telefone"
            pixKey = allPix[loginIndex].phoneKey
        }
        if editPixIndex == 3 {
            pixKeyType = "E-mail"
            pixKey = allPix[loginIndex].emailKey
        }
    }
    //MARK: - delete key
    func deleteKey(){
        let verify = verifyRegisterKey()
        
        if verify == true {
            if pixKeyType == "CPF"{
                updatePix.cpfKey = "Cadastrar Nova Chave"
                allPix[loginIndex] = updatePix
                //pixService.updateClientPix(editClientPix: updatePix)
                reloadUpdateAllPixKeys()
                dismissView()
            }
            
            if pixKeyType == "Chave aleatória"{
                updatePix.randomKey = "Cadastrar Nova Chave"
                allPix[loginIndex] = updatePix
                reloadUpdateAllPixKeys()
                dismissView()
            }
            
            if pixKeyType == "Telefone"{
                updatePix.phoneKey = "Cadastrar Nova Chave"
                allPix[loginIndex] = updatePix
                reloadUpdateAllPixKeys()
                dismissView()
            }
            
            if pixKeyType == "E-mail"{
                updatePix.emailKey = "Cadastrar Nova Chave"
                allPix[loginIndex] = updatePix
                reloadUpdateAllPixKeys()
                dismissView()
            }
        }
    }
    
    func verifyRegisterKey() -> Bool{
        if editPixIndex == 0 && pixKey == "Cadastrar Nova Chave"{
            displayAlert(title: "Erro", message: String(format: NSLocalizedString("Chave CPF não possui cadastro", comment: " ")))
            return false
        }
        
        if editPixIndex == 1 && pixKey == "Cadastrar Nova Chave"{
            displayAlert(title: "Erro", message: String(format: NSLocalizedString("Chave aleatória não possui cadastro", comment: " ")))
            return false
        }
        
        if editPixIndex == 2 && pixKey == "Cadastrar Nova Chave"{
            displayAlert(title: "Erro", message: String(format: NSLocalizedString("Chave telefone não possui cadastro", comment: " ")))
            return false
        }
        
        if editPixIndex == 3 && pixKey == "Cadastrar Nova Chave"{
            displayAlert(title: "Erro", message: String(format: NSLocalizedString("Chave e-mail não possui cadastro", comment: " ")))
            return false
        }
        
        return true
    }
}

extension PixKeyDetailViewModel: PixKeyDetailViewModeling {
    
    func displayAlert(title: String, message: String) {
        self.delegate?.displayAlert(title: title, message: message)
    }
    
    func dismissView() {
        self.delegate?.onSuccessDismiss()
    }
    
    func reloadUpdateAllPixKeys() {
        self.reloadDelegate?.updateAllKeys()
    }
}
