import Foundation
import UIKit


protocol Coordinator {
    var navigationController : UINavigationController { get }
    func  start ()
    init (navigationController: UINavigationController)
}

