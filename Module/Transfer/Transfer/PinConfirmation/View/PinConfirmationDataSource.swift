//
//  PinConfirmationDataSource.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class PinConfirmationDataSource: NSObject, UITableViewDataSource {
    
    var viewController: PinConfirmationViewController!
    var transferData: MakeTransferEntity = MakeTransferEntity()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PinConfirmationViewCell", for: indexPath) as! PinConfirmationViewCell
        cell.delegate = self.viewController
        cell.transferData = transferData
        cell.stopLoading()
        cell.loadData()
        return cell

    }
}
