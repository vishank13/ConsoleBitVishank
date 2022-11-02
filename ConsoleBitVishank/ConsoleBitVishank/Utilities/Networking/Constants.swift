//
//  Constants.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation

struct BaseURL {
    static let baseURL = "https://api.equation.consolebit.com/api/v1/"
}

struct Endpoints {
    static let loginUser = "auth/login/"
    static let getEmployee = "testing/employee/"
}

enum AuthParameters: String {
    case email = "email"
    case password = "password"
}


