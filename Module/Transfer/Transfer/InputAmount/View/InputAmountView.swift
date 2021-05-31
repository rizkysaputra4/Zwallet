//
//  InputAmountView.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core

class InputAmountView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: InputAmountPresenter?
    var dataSource = InputAmountDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        self.presenter?.loadData()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "InputAmountCell", bundle: Bundle(identifier: "com.casestudy.Transfer")), forCellReuseIdentifier: "InputAmountCell")

        self.tableView.dataSource = self.dataSource
    }

}

extension InputAmountView: InputAmountCellDelegate {
    
    func showError(message: String) {
        errorAlert(vc: self, message: message)
    }
    
    func toBack() {
        self.presenter?.toBack(vc: self)
    }
    
    func submitAmount(data: MakeTransferEntity) {
        self.presenter?.navigateToConfirmation(vc: self, transferData: data)
    }
}

extension InputAmountView: InputAmount {
    
    func loadData(makeTransaction: MakeTransferEntity) {
        self.dataSource.transferData = makeTransaction
        self.tableView.reloadData()
    }
    
}
