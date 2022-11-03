//
//  EmployeeTableViewCell.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    //-----------------------
    // MARK: Outlets
    //-----------------------
    @IBOutlet weak var baseBgView: UIView!
    @IBOutlet weak var employeeImageView: CustomImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var joiningDateLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    //-----------------------
    // MARK: Properties
    //-----------------------
    var navigationController: UINavigationController?
    
    //-----------------------
    // MARK: Lifeycle Methods
    //-----------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //-----------------------
    // MARK: SetUp Methods
    //-----------------------
    func setUp() {
        employeeImageView.layer.cornerRadius = employeeImageView.bounds.height / 2
        employeeImageView.layer.borderWidth = 1
        employeeImageView.layer.borderColor = UIColor.lightGray.cgColor
        baseBgView.layer.cornerRadius = 20
    }
    
    func setUpTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        employeeImageView.isUserInteractionEnabled = true
        employeeImageView.addGestureRecognizer(tap)
    }
    
    //-----------------------
    // MARK: Bind Data
    //-----------------------
    func bindData(employee: Employee) {
        guard let firstName = employee.firstName,
              let lastName = employee.lastName,
              let joiningDate = employee.doh,
              let designation = employee.designation,
              let salary = employee.salary,
              let address = employee.address
        else { return }
        nameLabel.text = "Name: \(firstName) \(lastName)"
        joiningDateLabel.text = Helper.getDateFrom(string: joiningDate)
        designationLabel.text = "Designation: \(designation)"
        salaryLabel.text = "Salary: ₹\(salary)"
        addressLabel.text = "Address: \(address)"
        
        if let imageURL = URL(string: employee.photo ?? "") {
            employeeImageView.loadImage(from: imageURL)
            setUpTapGesture()
        } else {
            employeeImageView.image = UIImage(systemName: "person.circle")
        }
    }
    
    //-----------------------
    // MARK: Objective Methods
    //-----------------------
    @objc func imageTapped() {
        ProjectWireframe.navigateToProfileImageViewController(profileImage: employeeImageView.image!, with: self.navigationController)
    }
}
