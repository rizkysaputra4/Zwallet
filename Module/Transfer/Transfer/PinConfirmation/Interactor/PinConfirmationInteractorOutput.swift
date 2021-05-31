//
//  ConfirmationInteractorOutput.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol PinConfirmationInteractorOutput {
    func loadTransferData(data: MakeTransferEntity)
    func pinConfirmationOutput(isSuccess: Bool, message: String, data: MakeTransferEntity, response: TransferReceive?, vc: UIViewController)
}
