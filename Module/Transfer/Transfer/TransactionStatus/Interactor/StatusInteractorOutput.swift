//
//  StatusInteractorOutput.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

protocol StatusInteractorOutput {
    func loadTransferData(data: MakeTransferEntity, response: TransferReceive?)
}
