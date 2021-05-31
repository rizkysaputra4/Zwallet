//
//  ConfirmationRouter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol ConfirmationRouter {
    func navigateToBack(vc: UIViewController)
    func navigateToPinConfirmation(vc: UIViewController, data: MakeTransferEntity)
}
