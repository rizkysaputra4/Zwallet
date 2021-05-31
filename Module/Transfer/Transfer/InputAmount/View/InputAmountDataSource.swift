//
//  InputAmountDataSource.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class InputAmountDataSource: NSObject, UITableViewDataSource {
    
    var viewController: InputAmountView!
    var transferData: MakeTransferEntity?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "InputAmountCell", for: indexPath) as! InputAmountCell
        cell.delegate = self.viewController
        cell.transferData = transferData

        cell.loadData()
        return cell

        
    }
}
