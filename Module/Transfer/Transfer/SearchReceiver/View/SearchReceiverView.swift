//
//  SearcbReceiverView.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core

class SearchReceiverView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SearchReceiverPresenter?
    var dataSource = SearchReceiverDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "FindReceiverCell", bundle: Bundle(identifier: "com.casestudy.Transfer")), forCellReuseIdentifier: "FindReceiverCell")
        self.tableView.register(UINib(nibName: "ReceiverResultCell", bundle: Bundle(identifier: "com.casestudy.Transfer")), forCellReuseIdentifier: "ReceiverResultCell")

        self.tableView.dataSource = self.dataSource
    }
}

extension SearchReceiverView: SearchReceiver {
    
    func showError(message: String) {
        errorAlert(vc: self, message: message)
    }
    
    func showReceiver(receivers: [ReceiverData]) {
        self.dataSource.searchResult = receivers
        self.dataSource.isLoading = false
        self.tableView.reloadData()
    }
}

extension SearchReceiverView: FindReceiverCellDelegate {
    
    func toBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchReceiver(keyword: String) {
        self.dataSource.isLoading = true
        self.tableView.reloadData()
        self.presenter?.searchReceiver(keyword: keyword)
    }
}

extension SearchReceiverView: ReceiverResultCellDelegate {
    
    func toInputAmount(transferData: MakeTransferEntity) {
        self.presenter?.toInputAmountScene(viewController: self, transferData: transferData)
    }
    
}
