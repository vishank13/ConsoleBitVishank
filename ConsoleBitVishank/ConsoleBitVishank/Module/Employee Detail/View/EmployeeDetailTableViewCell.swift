//
//  EmployeeTableViewCell.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import UIKit

class EmployeeDetailTableViewCell: UITableViewCell {
    
    //-----------------------
    // MARK: Outlets
    //-----------------------
    @IBOutlet weak var baseBgView: UIView!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    //-----------------------
    // MARK: Lifecycle Methods
    //-----------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //-----------------------
    // MARK: Bind Data
    //-----------------------
    func bindData(employee: EmployeeDetail) {
        keyLabel.text = employee.key
        valueLabel.text = employee.value
    }
    
}
