import Foundation
import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 6
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        additionalCellTextFieldSetup(textField)
    }
    
    func additionalCellTextFieldSetup(_ textField: UITextField?) {
        switch textField?.tag{
        case 1:
            textField?.text = textField?.text?.formatMask(mask: "#-#")
        case 2:
            if textField?.text?.count == 6 {
                textField?.text = textField?.text?.formatMask(mask: "####-#")
                textField?.isUserInteractionEnabled = true
            }
            if textField?.text?.count == 5 {
                textField?.text = textField?.text?.formatMask(mask: "###-#")
                textField?.isUserInteractionEnabled = true
            }
            if textField?.text?.count == 4 {
                textField?.text = textField?.text?.formatMask(mask: "##-#")
                textField?.isUserInteractionEnabled = true
            }
            if textField?.text?.count == 3 {
                textField?.text = textField?.text?.formatMask(mask: "#-#")
                textField?.isUserInteractionEnabled = true
            }
            if textField?.text?.count == 2 {
                textField?.text = textField?.text?.formatMask(mask: "#-#")
                textField?.isUserInteractionEnabled = true
            }
        default:
            break
        }
    }
}







