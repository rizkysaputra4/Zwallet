//
//  LoginInteractorOutput.swift
//  Login
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import UIKit

protocol LoginInteractorOutput {
    func authenticationResult(isSuccess: Bool)
    func toCreatePin()
}
