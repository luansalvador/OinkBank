//
//  Colors.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

extension UIColor {
    
    struct MyTheme {
        static var backgroundColor: UIColor = .systemBackground
        static var blueColor: UIColor = UIColor(red: 160/255, green: 190/255, blue: 255/255, alpha: 1)
        static var greenColor: UIColor = UIColor(red: 155/255, green: 247/255, blue: 255/255, alpha: 1)
        static var grayColor: UIColor = UIColor(named: "gray") ?? .systemBackground
        static var blackColor: UIColor = .black
        
        static var whiteTextColor: UIColor = .white
        static var deleteTextColor: UIColor = .systemRed
        static var defaultTextColor: UIColor = .label
        
        static var homeIconColor: UIColor = UIColor(red: 155/255, green: 247/255, blue: 255/255, alpha: 1)
    }
}
