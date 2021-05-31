//
//  RegisterInteractor.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation

protocol RegisterInteractor {
    func postRegisterData(userName: String, email: String, password: String)
}
