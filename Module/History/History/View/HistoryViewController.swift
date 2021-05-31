//
//  HistoryViewController.swift
//  History
//
//  Created by Rizky Saputra on 25/05/21.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = HistoryDataSource()
    var presenter: HistoryPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        self.presenter?.loadTransaction()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
    
        self.tableView.register(UINib(nibName: "FilterSectionCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "FilterSectionCell")
        self.tableView.register(UINib(nibName: "TransactionHistoryCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "TransactionHistoryCell")
        self.tableView.register(UINib(nibName: "BarSectionCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "BarSectionCell")

        self.tableView.dataSource = self.dataSource
    }
}

extension HistoryViewController: HistoryView {

    func showTransactionData(transactions: [TransactionHistoryEntity]) {
        self.dataSource.transactions = transactions
        self.dataSource.isLoading = false
        self.tableView.reloadData()
    }
    
    func toHome() {
        presenter?.navigateToHome(viewController: self)
    }
}

extension HistoryViewController: BarSectionCellDelegate {
    
    func navigateToHome() {
        self.presenter?.navigateToHome(viewController: self)
    }
}

extension HistoryViewController: FilterSectionDelegate {
    
    func btnUpTapped() {
        
    }
    
    func btnDownTapped() {
        
    }
    
    func filterTapped() {
        
    }

}
