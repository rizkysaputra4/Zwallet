//
//  StatusDataSource.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class StatusDataSource: NSObject, UITableViewDataSource {
    
    var viewController: StatusViewController!
    var response: TransferReceive?
    var transferData: MakeTransferEntity = MakeTransferEntity()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "StatusViewCell", for: indexPath) as! StatusViewCell
        cell.delegate = self.viewController
        cell.transferData = transferData
        
        if response != nil {
            cell.loadData(isSuccess: true)
        } else {
            cell.loadData(isSuccess: false)
        }

        return cell

        
    }
}
