//
//  InputAmountInteractorOutput.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

protocol InputAmountInteractorOutput {
    func submitAmountResult(isSuccess: Bool, message: String)
    func loadTransferData(transferData: MakeTransferEntity)
}
