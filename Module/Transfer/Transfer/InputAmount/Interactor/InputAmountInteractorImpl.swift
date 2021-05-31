//
//  InputAmountInteractorImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

class InputAmountInteractorImpl: InputAmountInteractor {
    
    var interactorOutput: InputAmountInteractorOutput?
    var presenter: InputAmountPresenter?
    var transferNetworkManager: TransferNetworkManager
    
    var makeTransfer: MakeTransferEntity?
    
    init(networkManager: TransferNetworkManager) {
        self.transferNetworkManager = networkManager
    }
    
    func submitAmount(amount: Double) {
        
    }
    
    func getTransferData() -> MakeTransferEntity {
        return self.makeTransfer!
    }
    
    func loadData() {
        self.interactorOutput?.loadTransferData(transferData: self.makeTransfer!)
    }
}
