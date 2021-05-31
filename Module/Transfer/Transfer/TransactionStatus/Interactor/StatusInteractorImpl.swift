//
//  StatusInteractorImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

class StatusInteractorImpl: StatusInteractor {

    var interactorOutput: StatusInteractorOutput?
    var transferNetworkManager: TransferNetworkManager
    var transferResponse: TransferReceive?
    var makeTransfer: MakeTransferEntity!
    
    init(networkManager: TransferNetworkManager) {
        self.transferNetworkManager = networkManager
    }
    
    func loadData() {
        self.interactorOutput?.loadTransferData(data: makeTransfer, response: transferResponse)
    }
    
    func postTransfer(data: MakeTransferEntity) {
        
        let amount = data.amount!
        let receiver = (data.receiver?.id)!
        let notes = data.notes!
        let pin = data.pin!
        
        _ = TransferEntity(receiver: receiver, amount: amount, notes: notes, pin: pin)
        
    }
}
