//
//  UIViewController + Helper.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "ERROR", message: "Please enter all details", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
        self.present(alert, animated: true)
    }
}
