//
//  ProjectWireframe.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation
import UIKit

class ProjectWireframe {
    
    static func navigateToRootViewController(with navigationController: UINavigationController?) {
        if let navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    static func navigateToLoginViewController(with navigationController: UINavigationController?) {
        if let loginViewController = ServiceLocator.provideLoginViewController(), let navigationController {
            loginViewController.loginViewModel = LoginViewModel()
            navigationController.setNavigationBarHidden(true, animated: false)
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
    
    static func navigateToEmployeeDetailViewController(employee: Employee, with navigationController: UINavigationController?) {
        if let employeeDetailViewController = ServiceLocator.provideEmployeeDetailViewController(), let navigationController {
            employeeDetailViewController.data = employee
            navigationController.setNavigationBarHidden(false, animated: true)
            navigationController.pushViewController(employeeDetailViewController, animated: true)
        }
    }
    
    static func navigateToProfileImageViewController(profileImage: UIImage, with navigationController: UINavigationController?) {
        if let profileImageViewController = ServiceLocator.provideProfileImageViewController(), let navigationController {
            navigationController.setNavigationBarHidden(false, animated: true)
            profileImageViewController.profileImage = profileImage
            navigationController.pushViewController(profileImageViewController, animated: true)
        }
    }
    
    static func navigateToFilterViewController(emp: [Employee], with navigationController: UINavigationController?, callback: @escaping ((_ filteredList: [Employee]) -> Void)) {
        if let filterViewController = ServiceLocator.provideFilterViewController(), let navigationController {
            navigationController.setNavigationBarHidden(false, animated: true)
            filterViewController.emp = emp
            filterViewController.callback = callback
            navigationController.pushViewController(filterViewController, animated: true)
        }
    }
}
