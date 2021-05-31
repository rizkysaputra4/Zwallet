//
//  InputAmountRouter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol InputAmountRouter {
    
    func navigateToConfirmation(vc: UIViewController, transferData: MakeTransferEntity)
    func navigateToBack(vc: UIViewController)
}
