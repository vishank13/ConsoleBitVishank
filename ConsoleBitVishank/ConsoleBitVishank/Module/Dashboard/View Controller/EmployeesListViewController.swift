//
//  EmployeeListViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import UIKit

class EmployeesListViewController: UIViewController {
    //-----------------------
    // MARK: Outlets
    //-----------------------
    @IBOutlet weak var employeesTableView: UITableView!
    
    //-----------------------
    // MARK: Properties
    //-----------------------
    var employeesViewModel: EmployeesViewModel?
    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        registerNib()
        fetchEmployees()
    }
    
    //-----------------------
    // MARK: SetUp Methods
    //-----------------------
    func setUp() {
        NetworkMonitor.shared.startMonitoring()
        title = "Home"
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func registerNib() {
        employeesTableView.register(UINib(nibName: EmployeeTableViewCell.className, bundle: nil), forCellReuseIdentifier: EmployeeTableViewCell.className)
    }
    
    func fetchEmployees() {
        if NetworkMonitor.shared.isReachable {
            employeesViewModel?.getAllEmployees(success: { [weak self] response in
                guard response.count != nil else { return }
                self?.employees = DetailHandler.fetchData()
                self?.employeesTableView.reloadData()
                print(DetailHandler.fetchData().count)
            })
        } else {
            employees = DetailHandler.fetchData()
        }
       
    }
        
    @IBAction func addEmployeePressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        Helper.performLogout()
        ProjectWireframe.navigateToLoginViewController(with: self.navigationController)
    }
}

//-----------------------
// MARK: Extension UITableViewDelegate
//-----------------------
extension EmployeesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.className) as? EmployeeTableViewCell else { return UITableViewCell() }
        cell.bindData(employee: employees[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ProjectWireframe.navigateToEmployeeDetailViewController(employee: employees[indexPath.row], with: self.navigationController)
    }
}
