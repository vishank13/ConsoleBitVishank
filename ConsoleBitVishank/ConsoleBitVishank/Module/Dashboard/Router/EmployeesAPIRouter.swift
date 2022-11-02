//
//  EmployeesAPIRouter.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation
import Alamofire

class EmployeesAPIRouter {
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTU0MzE5LCJqdGkiOiJkNzJjNjA3ZDViMjM0ZWM5YWQwNmUzNmZkMzM2Y2NlYiIsInVzZXJfaWQiOjN9.6b3aCkpLv2YqE1fHsHP6zj9byKFzQEd7WRKRgjfzxVI"]
    
    func getAllEmployees(success: @escaping (_ response: Employees) -> Void) {
        AF.request(BaseURL.baseURL + Endpoints.getEmployee, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseDecodable(of: Employees.self) { (response) in
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
