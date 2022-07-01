import Foundation
import UIKit

extension RegisterViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 10 {
            textField.text = (textField.text! as NSString).replacingCharacters(in: range, with: string.lowercased())
            return false
        }
        return true
    }
}
