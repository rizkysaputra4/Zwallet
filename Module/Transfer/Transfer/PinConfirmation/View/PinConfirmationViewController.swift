//
//  PinConfirmationViewController.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core

class PinConfirmationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PinConfirmationPresenter?
    var dataSource = PinConfirmationDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        self.presenter?.loadData()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "PinConfirmationViewCell", bundle: Bundle(identifier: "com.casestudy.Transfer")), forCellReuseIdentifier: "PinConfirmationViewCell")

        self.tableView.dataSource = self.dataSource
    }


}

extension PinConfirmationViewController: PinConfirmationCellDelegate {
    
    func toBack() {
        self.presenter?.navigateToBack(vc: self)
    }
    
    func confirmTransfer(data: MakeTransferEntity) {
        self.presenter?.postTransfer(data: data, vc: self)
    }
    
}

extension PinConfirmationViewController: PinConfirmationView {
    
    func showError(message: String) {
        errorAlert(vc: self, message: message)
    }
    
    func showData(data: MakeTransferEntity) {
        self.dataSource.transferData = data
        self.tableView.reloadData()
    }

}
