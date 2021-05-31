//
//  ConfirmationInteractor.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol PinConfirmationInteractor {
    func loadData()
    func postTransfer(data: MakeTransferEntity, vc: UIViewController)
}
