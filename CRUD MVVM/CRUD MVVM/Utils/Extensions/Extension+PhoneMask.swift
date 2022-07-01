import Foundation
import UIKit


extension RegisterPixKeyViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        additionalCellTextFieldSetup(textField)
    }
    
    func additionalCellTextFieldSetup(_ textField: UITextField?) {
        switch textField?.tag{
        case 1:
            textField?.text = textField?.text?.formatMask(mask: "(##)#####-####)")
        default:
            break
        }
    }
    
}
