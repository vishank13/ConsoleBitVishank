//
//  ProjectWireframe.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation
import UIKit

class ProjectWireframe {
    
    static func navigateToLoginViewController(with navigationController: UINavigationController?) {
        if let loginViewController = ServiceLocator.provideLoginViewController(), let navigationController {
            loginViewController.loginViewModel = LoginViewModel()
            navigationController.setNavigationBarHidden(true, animated: true)
            navigationController.pushViewController(loginViewController, animated: false)
        }
    }
    
    static func navigateToEmployeesListViewController(with navigationController: UINavigationController?) {
        if let employeesListViewController = ServiceLocator.provideEmployeesListViewController(), let navigationController {
            employeesListViewController.employeesViewModel = EmployeesViewModel()
            navigationController.setNavigationBarHidden(false, animated: true)
            navigationController.pushViewController(employeesListViewController, animated: true)
        }
    }
    
}
