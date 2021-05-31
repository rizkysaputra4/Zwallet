//
//  ConfirmationRouter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol PinConfirmationRouter {
    func navigateToBack(vc: UIViewController)
    func navigateToTransactionStatus(vc: UIViewController, response: TransferReceive?, data: MakeTransferEntity)
}
