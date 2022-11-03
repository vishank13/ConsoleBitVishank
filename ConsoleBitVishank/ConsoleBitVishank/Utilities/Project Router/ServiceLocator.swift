//
//  ServiceLocator.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation
import UIKit

class ServiceLocator {
    
    static func provideRootViewController() -> UIViewController {
        let isLoggedIn = UserDefaults.standard.bool(forKey: AppConstants.loggedIn)
        if isLoggedIn {
            return provideEmployeesListViewController()!
        } else {
            return provideLoginViewController()!
        }
    }
    
    static func provideEmployeesListViewController() -> EmployeesListViewController? {
        let storyBoard = UIStoryboard(name: AppStoryboardName.dashboard.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: EmployeesListViewController.className) as? EmployeesListViewController
        vc?.employeesViewModel = EmployeesViewModel()
        return vc
    }
    
    static func provideLoginViewController() -> LoginViewController? {
        let storyBoard = UIStoryboard(name: AppStoryboardName.main.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: LoginViewController.className) as? LoginViewController
        vc?.loginViewModel = LoginViewModel()
        return vc
    }
    
    static func provideEmployeeDetailViewController() -> EmployeeDetailViewController? {
        let storyBoard = UIStoryboard(name: AppStoryboardName.dashboard.rawValue, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: EmployeeDetailViewController.className) as? EmployeeDetailViewController
        return vc
    }
    
    
    
}
