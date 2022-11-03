//
//  LoginModel.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation

struct Login: Codable {
    let access, refresh: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let firstName, lastName, email: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}
