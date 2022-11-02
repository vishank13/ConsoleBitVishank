//
//  EmployeesViewModel.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation

class EmployeesViewModel {
    
    func getAllEmployees(success: @escaping (_ response: Employees) -> Void) {
        EmployeesAPIRouter().getAllEmployees { response in
            success(response)
        }
    }
}
