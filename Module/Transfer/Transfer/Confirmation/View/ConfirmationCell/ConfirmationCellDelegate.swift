//
//  ConfirmationCellDelegate.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol ConfirmationCellDelegate {
    func toBack()
    func confirmTransfer(data: MakeTransferEntity)
}
