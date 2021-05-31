//
//  RegisterCellDelegate.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation

protocol RegisterCellDelegate {
    func toLogin()
    func signUp(email: String, userName: String, password: String)
}
