//
//  ConfirmationInteractorImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core
import UIKit

class PinConfirmationInteractorImpl: PinConfirmationInteractor {

    
    var interactorOutput: PinConfirmationInteractorOutput?
    var transferNetwork: TransferNetworkManager
    var makeTransfer: MakeTransferEntity!
    
    init(transferManager: TransferNetworkManager) {
        self.transferNetwork = transferManager
    }
    
    func loadData() {
        self.interactorOutput?.loadTransferData(data: makeTransfer)
    }
    
    func postTransfer(data: MakeTransferEntity, vc: UIViewController) {
        
        let amount = data.amount!
        let receiver = (data.receiver?.id)!
        let notes = data.notes!
        let pin = data.pin!
        
        let transferData = TransferEntity(receiver: receiver, amount: amount, notes: notes, pin: pin)

        
        self.transferNetwork.transfer(data: transferData) { (data, error) in
            
            guard let checkPinResponse = data else {
                self.interactorOutput?.pinConfirmationOutput(isSuccess: false, message: error.debugDescription, data: self.makeTransfer, response: nil, vc: vc)
                return
            }
            
            if checkPinResponse.status == 200 {
                self.interactorOutput?.pinConfirmationOutput(isSuccess: true, message: "", data: self.makeTransfer, response: checkPinResponse.details, vc: vc)
            } else {
                self.interactorOutput?.pinConfirmationOutput(isSuccess: false, message: checkPinResponse.message, data: self.makeTransfer, response: nil, vc: vc)
            }
            
        }
    }
}
