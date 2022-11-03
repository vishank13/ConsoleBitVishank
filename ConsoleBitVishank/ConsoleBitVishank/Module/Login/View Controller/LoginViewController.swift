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
        emailIdTextField.text = "test@example.com"
        passwordTextField.text = "testing@example"
    }
    
    //-----------------------
    // MARK: SetUp Methods
    //-----------------------
    func setUp() {
        gradientBg()
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
    
    func gradientBg() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = AppColors.palette
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.shouldRasterize = true
        baseBgView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        view.endEditing(true)
        guard let email = emailIdTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else { return self.showAlert()       }
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

