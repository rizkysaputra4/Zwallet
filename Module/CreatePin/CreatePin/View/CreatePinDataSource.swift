//
//  CreatePinDataSource.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit
import Core

class CreatePinDataSource: NSObject, UITableViewDataSource {
    
    var viewController: CreatePinViewController!
    
    var pin: String = ""
    var hasCreatePin: Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreatePinCell", for: indexPath) as! CreatePinCell
        
        cell.delegate = self.viewController
        
        if hasCreatePin {
            cell.createPinSuccessView()
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
