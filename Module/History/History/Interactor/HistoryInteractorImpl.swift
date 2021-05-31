//
//  HistoryInteractorImpl.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation
import Core

class HistoryInteractorImpl: HistoryInteractor {

    var interactorOutput: HistoryInteractorOutput?
    
    let invoiceNetworkManager: InvoiceNetworkManager
    
    init(invoiceNetworkManager: InvoiceNetworkManager) {
        self.invoiceNetworkManager = invoiceNetworkManager
    }
    
    func getTransaction() {
        self.invoiceNetworkManager.getThisWeekinvoice { (rawData, error) in
            var transaction: [TransactionHistoryEntity] = []
            
            guard let dataResponse = rawData else {
                UserDefaultHelper.shared.remove(key: .userToken)
                self.interactorOutput?.toHome()
                return
            }
            
            if dataResponse.status != 200 {
                UserDefaultHelper.shared.remove(key: .userToken)
                self.interactorOutput?.toHome()
                return
            }
            
            let data = dataResponse.data
            
            data.forEach({ (invoiceData) in
                transaction.append(TransactionHistoryEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes, createdAt: invoiceData.createdAt))
                
            })
            self.interactorOutput?.loadedTransaction(transactions: transaction)
        }
    }
}
