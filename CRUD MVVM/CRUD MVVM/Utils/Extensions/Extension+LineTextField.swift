import Foundation
import UIKit

extension UIView {
    
    func addBottomLineWithColor(color: UIColor, width: CGFloat) {
        
        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = color.cgColor
        bottomBorderLine.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(bottomBorderLine)
    }
}
