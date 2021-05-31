//
//  RegisterInteractorImpl.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import Core

class RegisterInteractorImpl: RegisterInteractor {
    
    var interactorOutput: RegisterInteractorOutput?
    var authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postRegisterData(userName: String, email: String, password: String) {
        self.authNetworkManager.register(email: email, userName: userName, password: password) { (data, error) in
        
            guard let registerData = data else {
                self.interactorOutput?.authtenticateRegisterResult(isSuccess: false, message: error.debugDescription)
                return
            }
            
            if registerData.status == 200 {
                self.interactorOutput?.authtenticateRegisterResult(isSuccess: true, message: "")
                UserDefaultHelper.shared.set(key: .userEmail, value: email)
            } else {
                self.interactorOutput?.authtenticateRegisterResult(isSuccess: false, message: registerData.message)
            }
        }
    }

}
