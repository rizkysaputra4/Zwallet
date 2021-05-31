//
//  PinConfirmationCellDelegate.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

protocol PinConfirmationCellDelegate {
    func toBack()
    func confirmTransfer(data: MakeTransferEntity)
}
