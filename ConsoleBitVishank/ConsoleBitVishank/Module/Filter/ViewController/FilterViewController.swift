//
//  FilterViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    //-----------------------
    // MARK: Outlets
    //-----------------------
    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var designationButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    
    //-----------------------
    // MARK: Properties
    //-----------------------
    var callback: ((_ filteredList: [Employee]) -> Void)?
    var emp = [Employee]()
    var filterType: FilterType?
    
    //-----------------------
    // MARK: Lifecycle Methods
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    //-----------------------
    // MARK: SetUp Methods
    //-----------------------
    func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .white

        view.gradientBg()
        nameButton.layer.cornerRadius = 20
        nameButton.layer.borderWidth = 1
        nameButton.layer.borderColor = UIColor.white.cgColor
        
        designationButton.layer.cornerRadius = 20
        designationButton.layer.borderWidth = 1
        designationButton.layer.borderColor = UIColor.white.cgColor
        
        addressButton.layer.cornerRadius = 20
        addressButton.layer.borderWidth = 1
        addressButton.layer.borderColor = UIColor.white.cgColor
        
        dateButton.layer.cornerRadius = 20
        dateButton.layer.borderWidth = 1
        dateButton.layer.borderColor = UIColor.white.cgColor
    }
    
    //-----------------------
    // MARK: Action Outlets
    //-----------------------
    @IBAction func namePressed(_ sender: UIButton) {
        filterType = .name
        let filteredList = emp.sorted {
            $0.firstName ?? "" < $1.firstName ?? ""
        }
        if let callback {
            callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func designationPressed(_ sender: UIButton) {
        filterType = .designation
        let filteredList = emp.sorted {
            $0.designation ?? "" < $1.designation ?? ""
        }
        if let callback {
            callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addressPressed(_ sender: UIButton) {
        filterType = .address
        let filteredList = emp.sorted {
            $0.address ?? "" < $1.address ?? ""
        }
        if let callback {
            callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePressed(_ sender: UIButton) {
        filterType = .date
        let filteredList = emp.sorted {
            $0.doh ?? "" < $1.doh ?? ""
        }
        if let callback {
            callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
