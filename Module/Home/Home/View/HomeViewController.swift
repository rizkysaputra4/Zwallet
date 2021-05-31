//
//  HomeViewController.swift
//  Home
//
//  Created by Rizky Saputra on 24/05/21.
//

import UIKit
import Core

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = HomeDataSource()
    
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTableView()
        self.presenter?.loadProfile()
        self.presenter?.loadTransaction()
    }
    
    func setupTableView() {
        self.navigationController?.isNavigationBarHidden = true
        self.dataSource.viewController = self
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "DashboardViewCell", bundle: Bundle(identifier: "com.casestudy.Home")), forCellReuseIdentifier: "DashboardViewCell")
        self.tableView.register(UINib(nibName: "TransactionTableViewCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionTableViewCell")

        self.tableView.dataSource = self.dataSource
        self.tableView.separatorStyle = .none
    }
}

extension HomeViewController: DashBoardCellDelegate {
    
    func showAllTransation() {
        self.presenter?.showHistory(viewController: self)
    }
    
    func logout() {
        self.presenter?.logout()
    }
    
    func toTransferScene() {
        self.presenter?.toTransferScene(viewController: self)
    }
}

extension HomeViewController: HomeView {
    
    func showLoginView() {
        self.presenter?.logout()
    }
    
    func showUserProfileData(userProfile: UserProfileEntity) {
        self.dataSource.userProfile = userProfile
        self.tableView.reloadData()
    }
    
    func showTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.transactions = transactions
        self.dataSource.isLoading = false
        self.tableView.reloadData()
    }
}
