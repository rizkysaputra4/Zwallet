//
//  HomeDataSource.swift
//  Home
//
//  Created by Rizky Saputra on 25/05/21.
//

import Foundation
import UIKit
import Core

class HomeDataSource: NSObject, UITableViewDataSource {
    
    var viewController: HomeViewController!
    
    var userProfile: UserProfileEntity = UserProfileEntity(name: "", balance: 0, phoneNumber: "", imageUrl: "")
    var transactions: [TransactionEntity] = []
    
    var isLoading = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if section == 0 {
            return 1
        } else {
            if transactions.count > 0 {
                return transactions.count
            } else if isLoading {
                return 10
            } else {
                return 0
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardViewCell", for: indexPath) as! DashboardViewCell
            
            if userProfile.name != "" {
                cell.stopLoading()
            }
            
            cell.showData(userProfile: self.userProfile)
            cell.delegate = self.viewController
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
            if transactions.count > 0 {
                cell.showData(transaction: self.transactions[indexPath.row])
            }
            
            if !isLoading {
                cell.stopLoading()
            }
            
            return cell
        }
    }
}


