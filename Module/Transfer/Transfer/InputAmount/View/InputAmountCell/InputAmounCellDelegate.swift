//
//  InputAmounCellDelegate.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

protocol InputAmountCellDelegate {
    func toBack()
    func submitAmount(data: MakeTransferEntity)
    func showError(message: String)
}
