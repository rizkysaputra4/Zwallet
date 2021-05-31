//
//  PinConfirmationView.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

protocol PinConfirmationView {
    func showData(data: MakeTransferEntity)
    func showError(message: String)
}
