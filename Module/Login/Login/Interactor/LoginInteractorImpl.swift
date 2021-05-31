//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import Core

class LoginInteractorImpl: LoginInteractor {

    var interactorOutput: LoginInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        

        self.authNetworkManager.login(email: email, pasword: password) { (data, error) in
            
            guard let loginData = data else {
                self.interactorOutput?.authenticationResult(isSuccess: false)
                return
            }
            
            UserDefaultHelper.shared.set(key: .userEmail, value: loginData.data.email)
            UserDefaultHelper.shared.set(key: .userToken, value: loginData.data.token)
            UserDefaultHelper.shared.set(key: .refreshToken, value: loginData.data.refreshToken)
            
            let tokenExpiredDate: Date = Calendar.current.date(byAdding: .second, value: loginData.data.expiredIn / 1000, to: Date()) ?? Date()
            
            UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredDate)
            
            if !loginData.data.hasPin {
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.data.token)
                self.interactorOutput?.toCreatePin()
                return
            }
            
            if loginData.status == 200 {
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.data.token)
                self.interactorOutput?.authenticationResult(isSuccess: true)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
            
            
            
        }
    }
}
