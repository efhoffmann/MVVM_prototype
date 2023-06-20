//
//  AlertMessage.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import Foundation
import UIKit

class AlertMessage: NSObject {
    
    static func alert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alert = UIAlertAction(title: title, style: .default)
        alertController.addAction(alert)
        
        viewController.present(alertController, animated: true)
    }
}
