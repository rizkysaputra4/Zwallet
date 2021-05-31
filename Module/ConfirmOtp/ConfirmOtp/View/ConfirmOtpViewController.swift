//
//  ConfirmOtpViewController.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import UIKit
import Login

class ConfirmOtpViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = ConfirmOtpDataSource()
    var presenter: ConfirmOtpPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }

    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension


        self.tableView.register(UINib(nibName: "ConfirmOtpCell", bundle: Bundle(identifier: "com.casestudy.ConfirmOtp")), forCellReuseIdentifier: "ConfirmOtpCell")
        self.tableView.dataSource = self.dataSource
    }
}

extension ConfirmOtpViewController: ConfirmOtpView {
    func showError(message: String) {
        let alert = UIAlertController(
            title: "Peringatan",
            message: "Error: \(message)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoginPage() {
//        self.presenter?.navigateToCreateLogin(viewController: self)
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ConfirmOtpViewController: ConfirmOtpCellDelegate {
    func submitConfirmOtp(email: String, otp: String) {
        self.presenter?.confirmOtp(email: email, otp: otp)
    }
}
