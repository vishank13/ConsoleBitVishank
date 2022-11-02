//
//  LoginAPIRouter.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation
import Alamofire

class LoginAPIRouter {
    
    func validateUser(email: String, password: String, success: @escaping (_ response: Login) -> Void) {
        let parameters = [
            AuthParameters.email.rawValue: email,
            AuthParameters.password.rawValue: password
        ]
        AF.request(BaseURL.baseURL + Endpoints.loginUser, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseDecodable(of: Login.self) { (response) in
            switch response.result {
            case .success:
                guard let user = response.value else { return }
                success(user)
            case .failure(let error):
                print(error)
            }
        }
    }
}
