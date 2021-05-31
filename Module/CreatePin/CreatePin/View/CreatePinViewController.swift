//
//  CreatePinViewController.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import UIKit

class CreatePinViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = CreatePinDataSource()
    
    var presenter: CreatePinPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTableView()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "CreatePinCell", bundle: Bundle(identifier: "com.casestudy.CreatePin")), forCellReuseIdentifier: "CreatePinCell")
        self.tableView.dataSource = self.dataSource
    }
}

extension CreatePinViewController: CreatePinCellDelegate {
    
    func submitOtp(email: String, otp: String) {
        self.presenter?.confirmOtp(email: email, otp: otp)
    }
    
    func showLoginScene() {
        self.presenter?.showLogin(viewController: self)
    }
    
    func submitPin(pin: String) {
        presenter?.confirmPin(pin: pin)
    }
}

extension CreatePinViewController: CreatePinView {
    
    func showCreatePinSuccess() {
        self.dataSource.hasCreatePin = true
        self.tableView.reloadData()
    }
    
    func showLogin() {
        self.presenter?.showLogin(viewController: self)
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
    
    
}
