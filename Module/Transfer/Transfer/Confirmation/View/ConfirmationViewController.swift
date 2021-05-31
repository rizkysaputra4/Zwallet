//
//  ConfirmationViewController.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ConfirmationPresenter?
    var dataSource = ConfirmationDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        self.presenter?.loadData()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "ConfirmationViewCell", bundle: Bundle(identifier: "com.casestudy.Transfer")), forCellReuseIdentifier: "ConfirmationViewCell")

        self.tableView.dataSource = self.dataSource
    }


}

extension ConfirmationViewController: ConfirmationCellDelegate {
    
    func toBack() {
        self.presenter?.navigateToBack(vc: self)
    }
    
    func confirmTransfer(data: MakeTransferEntity) {
        self.presenter?.navigateToPinConfirmation(vc: self, data: data)
    }
    
}

extension ConfirmationViewController: ConfirmationView {
    
    func showData(data: MakeTransferEntity) {
        self.dataSource.transferData = data
        self.tableView.reloadData()
    }

}
