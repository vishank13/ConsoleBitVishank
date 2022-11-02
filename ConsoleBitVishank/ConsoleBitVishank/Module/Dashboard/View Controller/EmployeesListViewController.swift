//
//  EmployeeListViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import UIKit

class EmployeesListViewController: UIViewController {

    
    //-----------------------
    // MARK: Properties
    //-----------------------
    var employeesViewModel: EmployeesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
