//
//  EmployeesAPIRouter.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class EmployeesAPIRouter {
    
    let accessToken = KeychainWrapper.standard.string(forKey: AppConstants.accessToken)
    
    func getAllEmployees(success: @escaping (_ response: Employees) -> Void) {
        guard let accessToken else { return }
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"]
        
        AF.request(BaseURL.baseURL + Endpoints.getEmployee, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseDecodable(of: Employees.self) { (response) in
            print(response)
            switch response.result {
            case .success:
                guard let employees = response.value else { return }
                success(employees)
            case .failure(let error):
                print(error)
            }
        }
    }
}
