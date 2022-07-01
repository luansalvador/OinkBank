import Foundation
import UIKit

//MARK: - Protocols
protocol EditDataViewModelDelegate: AnyObject {
    func displayAlert(title: String, message: String)
    func displayAlertWithDismissAction(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func onSuccessDismiss()
    
    func pushToIntro()
}

protocol EditDataViewModeling {
    var delegate: EditDataViewModelDelegate? { get set }
    var reloadDelegate: ShowDataViewModelReloadDelegate? { get }
    
    func displayAlert(title: String, message: String)
    func displayAlertWithDismissAction(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func dismissView()
    func reloadUpdateAllRegister()
    
    func pushToIntro()
}

final class EditDataViewModel {
    weak var delegate: EditDataViewModelDelegate?
    weak var reloadDelegate: ShowDataViewModelReloadDelegate?
    
    var cellTitle = ["Nome", "CPF", "Data de Nascimento", "E-Mail", "Renda Mensal", "Patrimônio Líquido"]
    
    init(reloadDelegate: ShowDataViewModelReloadDelegate? = nil) {
        self.reloadDelegate = reloadDelegate
    }
    
    func showInfo(row: Int) -> String{
        switch row {
        case 0: editClientName = clients[editIndex].name; return clients[editIndex].name
        case 1: editClientCpf = clients[editIndex].cpf; return clients[editIndex].cpf
        case 2: editClientBirthDate = clients[editIndex].birthDate; return clients[editIndex].birthDate
        case 3: editClientEmail = clients[editIndex].email; return clients[editIndex].email
        case 4: editClientMonthlyIncome = clients[editIndex].monthlyIncome; return clients[editIndex].monthlyIncome
        case 5: editClientNetWorth = clients[editIndex].netWorth; return clients[editIndex].netWorth
            
        default:
            break
        }
        
        return ""
    }
    
    //MARK: - New Client attributes and Add Functions
    var editClientName = ""
    var editClientCpf = ""
    var editClientBirthDate = ""
    var editClientEmail = ""
    var editClientMonthlyIncome = ""
    var editClientNetWorth = ""
    var editClientPassword = clients[editIndex].password
    var editClientBalance = clients[editIndex].balance
    var editClientAccount = clients[editIndex].account
    var editClientVerifyDigit = clients[editIndex].verifyDigit
    
    func updateClient(){
        let updateClient = Client(name: editClientName, cpf: editClientCpf, birthDate: editClientBirthDate, email: editClientEmail, monthlyIncome: editClientMonthlyIncome, netWorth: editClientNetWorth, password: editClientPassword, balance: Double(editClientBalance) , account: editClientAccount, verifyDigit: editClientVerifyDigit)
        
        let verifyEmail = verifyEmail(email: updateClient.email)
        print(updateClient.cpf)
        let verifyCpf = verifyCpf(cpf: updateClient.cpf)
        print(updateClient)
        
        if verifyEmail == true && verifyCpf == true{
            clients[editIndex] = updateClient
            
            reloadUpdateAllRegister()
            displayAlertWithDismissAction(title: "Sucesso", message: "Atualização realizada")
            print(updateClient)
        } else{
            print("else")
        }
    }
    
    // MARK: - Register Verify
    func verifyTf() -> Bool {
        let valuesTyped: [String] = [editClientName, editClientCpf, editClientEmail, editClientBirthDate, String(editClientMonthlyIncome), editClientNetWorth]
        
        for i in 0...valuesTyped.count-1{
            if valuesTyped[i] == "" || valuesTyped[i]  == "0.0"{
                
                return false
            }
        }
        return true
    }
    
    func verifyCpf(cpf: String) -> Bool {
        let cpfVerify = cpf.isValidCPF
        
        if cpf != clients[editIndex].cpf {
            
            return false
        }
        
        if cpfVerify == true {
            return true
        } else {
            
            return false
        }
    }
    
    func verifyEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let validate = emailPred.evaluate(with: email)
        
        if validate == true {
            return true
        } else {
            
            return false
        }
    }
    
    func verifyDate(date: Date){
        let date = date
        
        let minAge: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
        print(minAge)
        let maxAge: Date = Calendar.current.date(byAdding: .year, value: -120, to: Date())!;
        print(maxAge)
        
        if date >= minAge || date <= maxAge {
            
        } else {
            
        }
    }
    
    //MARK: - Delete
    func deleteClient(){
        clients.remove(at: editIndex)
        pushToIntro()
    }
    
    //MARK: - TextFieldVerifications
    func verifyTextFieldRealTime(index: Int, value: String) -> Bool {
        switch index {
            
        case 0:
            if value == "" {
                return false
            }
            else {
                return true
            }
            
        case 1:
            let verifyCpf = verifyCpf(cpf: value)
            
            if verifyCpf == true {
                return true
            }
            else {
                return false
            }
            
        case 2:
            if value == "" || value == "Selecionar"{
                return false
            }
            else {
                return true
            }
            
        case 3:
            let verifyEmail = verifyEmail(email: value)
            
            if verifyEmail == true {
                return true
            }
            else {
                return false
            }
            
        case 4:
            if value == "" || value == "Selecionar"{
                return false
            }
            else {
                return true
            }
            
        case 5:
            if value == "" {
                return false
            }
            else {
                return true
            }
            
        case 6:
            if value == "" {
                return false
            }
            else {
                return true
            }
            
        case 7:
            if value == "" {
                return false
            }
            else {
                return true
            }
        default:
            return false
        }
    }
}

//MARK: - RegisterViewModeling Extension
extension EditDataViewModel: EditDataViewModeling {
    func pushToIntro() {
        self.delegate?.pushToIntro()
    }
    
    
    func dismissView() {
        self.delegate?.onSuccessDismiss()
    }
    
    func reloadUpdateAllRegister() {
        self.reloadDelegate?.updateAllRegister()
    }
    
    func displayAlert(title: String, message: String) {
        delegate?.displayAlert(title: title, message: message)
    }
    
    func displayAlertWithDismissAction(title: String, message: String) {
        delegate?.displayAlertWithDismissAction(title: title, message: message)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        delegate?.displayAlertWithAction(title: title, message: message)
    }
}
