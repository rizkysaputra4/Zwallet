//
//  RegisterDataEntity.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation

struct UserRegisterEntity {

    var email: String
    var userName: String
    var password: String
    
    init(email: String, userName: String, password: String) {
        self.email = email
        self.password = password
        self.userName = userName
    }
}
