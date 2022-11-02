//
//  EmployeesModel.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation

struct Employees: Codable {
    let count: Int
    let employee: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let dob, hireDate: String
    let address: String
    let city: String
    let zipCode: String
    let country: String
    let phone: String
    let photo: String?
    let salary: String
    let designation: String
    let organizationName: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, dob
        case hireDate = "hire_date"
        case address, city
        case zipCode = "zip_code"
        case country, phone, photo, salary, designation
        case organizationName = "organization_name"
        case status
    }
}
