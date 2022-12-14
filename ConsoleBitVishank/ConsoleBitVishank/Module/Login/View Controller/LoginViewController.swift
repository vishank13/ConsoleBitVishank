//
//  LoginViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    //-----------------------
    // MARK: Outlets
    //-----------------------
    @IBOutlet weak var baseBgView: UIView!
    @IBOutlet weak var logoBgView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginBgView: UIView!
    @IBOutlet weak var emailIdBgView: UIView!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordBgView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //-----------------------
    // MARK: Properties
    //-----------------------
    var loginViewModel: LoginViewModel?
    
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
        view.gradientBg()
        logoBgView.layer.cornerRadius = 50
        loginBgView.layer.cornerRadius = 25
        
        emailIdBgView.layer.cornerRadius = 25
        emailIdBgView.layer.borderWidth = 1
        emailIdBgView.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordBgView.layer.cornerRadius = 25
        passwordBgView.layer.borderWidth = 1
        passwordBgView.layer.borderColor = UIColor.lightGray.cgColor
        
        loginButton.layer.cornerRadius = 25
        loginButton.backgroundColor = UIColor.link
    }
    
    //-----------------------
    // MARK: Action Outlets
    //-----------------------
    @IBAction func loginPressed(_ sender: UIButton) {
        view.endEditing(true)
        guard let email = emailIdTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else { return self.showAlert() }
        loginViewModel?.validateUser(with: email, password: password) { response in
            guard let user = response.user else {
                print("User not found")
                return
            }
            UserDefaults.standard.set(true, forKey: AppConstants.loggedIn)
            ProjectWireframe.navigateToEmployeesListViewController(with: self.navigationController)
        }
    }
    
}

//-----------------------
// MARK: Extension UITextField
//-----------------------
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

