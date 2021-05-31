//
//  HistoryViewDataSource.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation
import UIKit
import Core

class HistoryDataSource: NSObject, UITableViewDataSource {

    var viewController: HistoryViewController!
    var transactions: [TransactionHistoryEntity] = []
    var currentTimeGroup: GroupDate = .empty
    var rowExcess = 0
    var isLoading = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.rowExcess = 0
        
        switch section {
        case 0: return 1
        case 2: return 1
        case 1:
            if transactions.count > 0 {
                let Total = totalGroup()
                return transactions.count + Total
            }
            
            if isLoading {
                return 10
            }
            
            return 0
            
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return self.barSection(tableView: tableView, indexPath: indexPath)
        case 2: return self.filterSection(tableView: tableView, indexPath: indexPath)
        case 1: return self.transactionSection(tableView: tableView, indexPath: indexPath)
        default: return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func barSection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarSectionCell", for: indexPath) as! BarSectionCell
        cell.delegate = viewController
        return cell
    }
    
    func transactionSection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionHistoryCell", for: indexPath) as! TransactionHistoryCell
        let transactionRow = indexPath.row - self.rowExcess
       
        cell.startLoading()
        if transactionRow >= 0 && transactionRow < transactions.count {
            print(transactions.count, indexPath.row - self.rowExcess, self.rowExcess)
            let transactionTimeGroup = grouping(row: indexPath.row - self.rowExcess)
            
            if transactionTimeGroup != self.currentTimeGroup {
                self.currentTimeGroup = transactionTimeGroup
                cell.changeView(nibName: "TransactionGroupHeader")
                cell.setHeader(text: self.currentTimeGroup.rawValue)
                self.rowExcess += 1
            } else {
                cell.showData(transactionData: self.transactions[indexPath.row - self.rowExcess])
            }
        }
        
        if !isLoading {
            cell.stopLoading()
        }
        
        return cell
    }
    
    func filterSection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        if transactions.count == 0 {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSectionCell", for: indexPath) as! FilterSectionCell

        return cell
    }
    
    func grouping(row: Int) -> GroupDate {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
       
        let weekBefore = Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: Date())
        let monthBefore = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        
        let transactionCreateAt = dateFormatter.date(from: transactions[row].createdAt)
        
        let thisWeek = transactionCreateAt! > weekBefore!
        let thisMonth = !thisWeek && (transactionCreateAt! > monthBefore!)
    
        if thisWeek {
            return .thisWeek
        } else if thisMonth {
            return .thisMonth
        } else {
            return .Later
        }
    }
    
    func totalGroup() -> Int {
        var totalGroup = 0
        var currentGroup: GroupDate = .empty
        for i in 0...transactions.count - 1 {
            let groupType = grouping(row: i)
            if  groupType != currentGroup {
                currentGroup = groupType
                totalGroup += 1
            }
        }
        return totalGroup
    }
    
    func sortTransaction() {
        self.transactions.sort(by: { $0.createdAt < $1.createdAt })
    }
    
}

enum GroupDate: String {
    case thisWeek = "This Week"
    case thisMonth = "This Month"
    case Later = "Later"
    case empty = ""
}
