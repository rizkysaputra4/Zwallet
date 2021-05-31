//
//  RegisterView.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation

protocol RegisterView{
    func showLogin()
    func showError(message: String)
    func showCreatePin()
    func showConfirmToken()
    func reloadTable()
}
