//
//  LoginViewController.swift
//  Login
//
//  Created by Rizky Saputra on 24/05/21.
//

import UIKit
import SkeletonView

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var isSecured = true
    
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isFilled()
        emailText.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func didChange(_ textField: UITextField) {
        isFilled()
    }
    
    func isFilled() {
        let isDescriptionEmty = emailText.text?.isEmpty ?? true
        let isTotalEmpty = passwordText.text?.isEmpty ?? true

        if  isDescriptionEmty || isTotalEmpty {
            loginBtn.isEnabled = false
            loginBtn.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            loginBtn.layer.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 0.8470588235)
            loginBtn.isEnabled = true
        }
    }
    
    
    func startLoading() {
        self.loginBtn.showAnimatedGradientSkeleton()
        self.emailText.showAnimatedGradientSkeleton()
        self.passwordText.showAnimatedGradientSkeleton()
    }
    
    func stopLoading() {
        self.loginBtn.hideSkeleton()
        self.emailText.hideSkeleton()
        self.passwordText.hideSkeleton()
    }
    
    func loadStyle() {
        if isSecured {
            passwordText.isSecureTextEntry = true
        } else {
            passwordText.isSecureTextEntry = false
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        self.presenter?.showRegister(viewController: self)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let email: String = emailText.text ?? ""
        let password: String = passwordText.text ?? ""
        
        self.startLoading()
        self.presenter?.login(email: email, password: password)
    }
    
    @IBAction func iconAction(sender: AnyObject) {
        self.isSecured = !self.isSecured
        self.loadStyle()
    }
    
}

extension LoginViewController: LoginView {
    
    func showCreatePin() {
        self.presenter?.showCreatePin(viewController: self)
    }
    
    func showError() {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Username atau password anda salah, silahkan coba lagi",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
