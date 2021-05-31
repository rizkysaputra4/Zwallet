//
//  StatusInteractor.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

protocol StatusInteractor {
    func loadData()
    func postTransfer(data: MakeTransferEntity)
}
