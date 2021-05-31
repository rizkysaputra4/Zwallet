//
//  ConfirmOtpDataSource.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit
import Core

class ConfirmOtpDataSource: NSObject, UITableViewDataSource {
    
    var viewController: ConfirmOtpViewController!
    
    var pin: String = ""
    var hasCreatePin: Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOtpCell", for: indexPath) as! ConfirmOtpCell
        
        cell.delegate = self.viewController
                
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
