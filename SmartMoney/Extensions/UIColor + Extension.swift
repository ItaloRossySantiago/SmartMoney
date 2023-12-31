import UIKit
extension UIColor {
    convenience init?(hexString: String) {
        let formattedHexString = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        guard let hexValue = UInt32(formattedHexString, radix: 16) else {
            return nil
        }
        
        let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hexValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
