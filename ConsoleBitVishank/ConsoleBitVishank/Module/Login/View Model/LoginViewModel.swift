//
//  LoginViewModel.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation

class LoginViewModel {
        
    func validateUser(with email: String, password: String, success: @escaping (_ response: Login) -> Void) {
        LoginAPIRouter().validateUser(email: email, password: password) { response in
            success(response)
        }
    }
}
