//
//  SearchReceiverDataSource.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class SearchReceiverDataSource: NSObject, UITableViewDataSource {
    
    var viewController: SearchReceiverView!
    
    var searchResult: [ReceiverData] = []
    var isLoading = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if section == 0 {
            return 1
        } else {
            if searchResult.count > 0 {
                return searchResult.count
            } else if self.isLoading {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "FindReceiverCell", for: indexPath) as! FindReceiverCell
            cell.delegate = self.viewController
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverResultCell", for: indexPath) as! ReceiverResultCell
            
            if self.isLoading {
                cell.startLoading()
            } else {
                cell.stopLoading()
            }
                
            if searchResult.count > 0 {
                cell.delegate = self.viewController
                cell.showData(data: searchResult[indexPath.row])
            }
            
            return cell
        }
    }
}
