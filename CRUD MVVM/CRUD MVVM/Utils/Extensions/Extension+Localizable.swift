//
//  Extension+Localizable.swift
//  CRUD MVVM
//
//  Created by user217414 on 7/5/22.
//

import Foundation
import UIKit

extension String{
    
    
    func localized(tableName: String) -> String {
        return NSLocalizedString(self,tableName: tableName,bundle: .main,value: self,comment: self)
    }
    
    
    
}
