//
//  FilterViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var designationButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    
    var callback: ((_ filteredList: [Employee]) -> Void)?
    var emp = [Employee]()
    var filterType: FilterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        view.gradientBg()
        nameButton.layer.cornerRadius = 20
        designationButton.layer.cornerRadius = 20
        addressButton.layer.cornerRadius = 20
        dateButton.layer.cornerRadius = 20
    }
    
    @IBAction func namePressed(_ sender: UIButton) {
        filterType = .name
        var filteredList = emp.sorted {
            $0.firstName ?? "" < $1.firstName ?? ""
        }
        if let callback {
         callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func designationPressed(_ sender: UIButton) {
        filterType = .designation
        var filteredList = emp.sorted {
            $0.designation ?? "" < $1.designation ?? ""
        }
        if let callback {
         callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addressPressed(_ sender: UIButton) {
        filterType = .address
        var filteredList = emp.sorted {
            $0.address ?? "" < $1.address ?? ""
        }
        if let callback {
         callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePressed(_ sender: UIButton) {
        filterType = .date
        var filteredList = emp.sorted {
            $0.doh ?? "" < $1.doh ?? ""
        }
        if let callback {
         callback(filteredList)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
