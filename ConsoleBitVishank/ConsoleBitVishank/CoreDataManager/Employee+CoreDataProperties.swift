//
//  Employee+CoreDataProperties.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var id: String?
    @NSManaged public var emailID: String?
    @NSManaged public var dob: String?
    @NSManaged public var doh: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var country: String?
    @NSManaged public var phone: String?
    @NSManaged public var salary: String?
    @NSManaged public var designation: String?
    @NSManaged public var organization: String?
    @NSManaged public var status: String?
    @NSManaged public var photo: String?

}

extension Employee : Identifiable {

}
