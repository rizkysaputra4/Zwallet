//
//  RegisterViewController.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = RegisterDataSource()

    var presenter: RegisterPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "RegisterCell", bundle: Bundle(identifier: "com.casestudy.Register")), forCellReuseIdentifier: "RegisterCell")
        self.tableView.dataSource = self.dataSource
    }
}

extension RegisterViewController: RegisterCellDelegate {
   
    func signUp(email: String, userName: String, password: String) {
        self.presenter?.register(email: email, userName: userName, password: password)
    }
    
    func toLogin() {
        self.presenter?.navigateToLogin(viewController: self)
    }
}

extension RegisterViewController: RegisterView {
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Error: \(message)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showCreatePin() {
        self.presenter?.navigateToCreatePin(viewController: self)
    }
    
    func showLogin() {
        
    }
    
    func showConfirmToken() {
        self.presenter?.navigateToConfirmOtp(viewController: self)
    }
}
