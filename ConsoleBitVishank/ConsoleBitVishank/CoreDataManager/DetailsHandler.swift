//
//  DetailsHandler.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import Foundation
import CoreData
import UIKit

class DetailHandler {
    
    static func saveData( emplyeeData: EmployeeData) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let employeeObj = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employeeObj.firstName = emplyeeData.firstName
        employeeObj.lastName = emplyeeData.lastName
        employeeObj.id = "\(emplyeeData.id ?? 0)"
        employeeObj.emailID = emplyeeData.email
        employeeObj.dob = emplyeeData.dob
        employeeObj.doh = emplyeeData.hireDate
        employeeObj.address = emplyeeData.address
        employeeObj.city = emplyeeData.city
        employeeObj.zipCode = emplyeeData.zipCode
        employeeObj.country = emplyeeData.country
        employeeObj.photo = emplyeeData.photo
        employeeObj.phone = emplyeeData.phone
        employeeObj.salary = emplyeeData.salary
        employeeObj.organization = emplyeeData.organizationName
        employeeObj.status = emplyeeData.status
        employeeObj.designation = emplyeeData.designation
        do {
            try context.save()
            print("Data has been saved")
        } catch let error {
            print("Error ocurred - \(error)")
        }
    }
    
    static func deleteData(employee: Employee) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            try context.delete(employee)
            print("Data has been deleted")
            try context.save()
        } catch let error {
            print("Error ocurred - \(error)")
        }
    }
    
    static func fetchData() -> [Employee] {
        
        var data = [Employee]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            data = try context.fetch(Employee.fetchRequest()) as! [Employee]
        } catch let error {
            print("Error ocurred - \(error)")
        }
        return data
    }
    
    static func deleteAll() {
        var data = [Employee]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            data = try context.fetch(Employee.fetchRequest()) as! [Employee]
            data.forEach { emp in
                deleteData(employee: emp)
            }
        } catch let error {
            print("Error ocurred - \(error)")
        }
    }
}
