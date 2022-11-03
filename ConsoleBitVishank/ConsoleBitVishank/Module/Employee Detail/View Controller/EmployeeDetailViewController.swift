//
//  EmployeeDetailViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import UIKit

struct EmployeeDetail {
    var key: String
    var value: String
}

class EmployeeDetailViewController: UIViewController {
    
    @IBOutlet weak var baseBgView: UIView!
    @IBOutlet weak var profileImageView: CustomImageView!
    @IBOutlet weak var employeeDetailTableView: UITableView!
    
    var employee = [EmployeeDetail]()
    var data: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        registerNib()
        parseData()
    }
    
    func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        if let imageURL = URL(string: data?.photo ?? "") {
            profileImageView.loadImage(from: imageURL)
        } else {
            profileImageView.image = UIImage(systemName: "person.circle")
        }
    }
    
    func registerNib() {
        employeeDetailTableView.register(UINib(nibName: EmployeeDetailTableViewCell.className, bundle: nil), forCellReuseIdentifier: EmployeeDetailTableViewCell.className)
    }
    
    func parseData() {
        employee = [
            EmployeeDetail(key: "Name:", value: "\(data?.firstName ?? "") \(data?.lastName ?? "")"),
            EmployeeDetail(key: "ID:", value: "\(data?.id ?? "")"),
            EmployeeDetail(key: "Email ID:", value: data?.emailID ?? ""),
            EmployeeDetail(key: "Date Of Birth:", value: data?.dob ?? ""),
            EmployeeDetail(key: "Date Of Hire:", value: data?.doh ?? ""),
            EmployeeDetail(key: "Address:", value: data?.address ?? ""),
            EmployeeDetail(key: "City:", value: data?.city ?? ""),
            EmployeeDetail(key: "ZipCode:", value: data?.zipCode ?? ""),
            EmployeeDetail(key: "Country:", value: data?.country ?? ""),
            EmployeeDetail(key: "Phone No.:", value: data?.phone ?? ""),
            EmployeeDetail(key: "Salary:", value: data?.salary ?? ""),
            EmployeeDetail(key: "Designation:", value: data?.designation ?? ""),
            EmployeeDetail(key: "Organization Name:", value: data?.organization ?? ""),
            EmployeeDetail(key: "Status:", value: data?.status ?? ""),
        ]
    }
}

//-----------------------
// MARK: Extension TableView
//-----------------------
extension EmployeeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeDetailTableViewCell.className) as? EmployeeDetailTableViewCell else { return UITableViewCell() }
        cell.bindData(employee: employee[indexPath.row])
        return cell
    }
    
    
}
