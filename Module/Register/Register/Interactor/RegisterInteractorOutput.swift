//
//  RegisterInteractorOutput.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation

protocol RegisterInteractorOutput {
    func authtenticateRegisterResult(isSuccess: Bool, message: String)
}
