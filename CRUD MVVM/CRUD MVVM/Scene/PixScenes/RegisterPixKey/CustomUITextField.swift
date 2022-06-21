//
//  CustomUITextField.swift
//  CRUD MVVM
//
//  Created by user217414 on 5/31/22.
//

import Foundation
import UIKit //Don't forget this

let registerpix = RegisterPixKeyViewController()


class CustomUITextField: UITextField {
    
   
override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
if action == #selector(UIResponderStandardEditActions.paste(_:)) {
return false
}
return super.canPerformAction(action, withSender: sender)
}
    
}
    
