import Foundation
import UIKit

extension String {
    
    func formatMask(mask: String) -> String {
        let cleanField = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var result = ""
        var startIndex = cleanField.startIndex
        let endIndex = cleanField.endIndex
        
        for ch in mask where startIndex < endIndex {
            if ch == "#" {
                result.append(cleanField[startIndex])
                startIndex = cleanField.index(after: startIndex)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    
    func clearFormatMask() -> String{
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
}
