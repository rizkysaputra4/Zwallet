//
//  InputAmountInteractor.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

protocol InputAmountInteractor {
    func submitAmount(amount: Double)
    func getTransferData() -> MakeTransferEntity
    func loadData()
}
