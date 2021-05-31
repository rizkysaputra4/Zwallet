//
//  ConfirmationInteractorImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

class ConfirmationInteractorImpl: ConfirmationInteractor {

    var interactorOutput: ConfirmationInteractorOutput?
    var transferNetworkManager: TransferNetworkManager
    
    var makeTransfer: MakeTransferEntity!
    
    init(networkManager: TransferNetworkManager) {
        self.transferNetworkManager = networkManager
    }
    
    func loadData() {
        self.interactorOutput?.loadTransferData(data: makeTransfer)
    }
}
