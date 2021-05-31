//
//  StatusViewController.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core

class StatusViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: StatusPresenter?
    var dataSource = StatusDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        self.presenter?.loadData()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "StatusViewCell", bundle: Bundle(identifier: "com.casestudy.Transfer")), forCellReuseIdentifier: "StatusViewCell")

        self.tableView.dataSource = self.dataSource
    }


}

extension StatusViewController: StatusCellDelegate {
    
    func toRootBack() {
        self.presenter?.navigateToRoot(vc: self)
    }
    

    
}

extension StatusViewController: StatusView {
    
    func showData(data: MakeTransferEntity, response: TransferReceive?) {
        self.dataSource.transferData = data
        self.dataSource.response = response
        self.tableView.reloadData()
    }

}
