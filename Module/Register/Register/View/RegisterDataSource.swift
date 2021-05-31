//
//  RegisterDataSource.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit
import Core

class RegisterDataSource: NSObject, UITableViewDataSource {

    var viewController: RegisterViewController!
    
    var userRegister: UserRegisterEntity = UserRegisterEntity(email: "", userName: "", password: "")
    
    var isLoading = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterCell", for: indexPath) as! RegisterCell
//            cell.showData
        cell.delegate = self.viewController
        cell.stopLoading()
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
