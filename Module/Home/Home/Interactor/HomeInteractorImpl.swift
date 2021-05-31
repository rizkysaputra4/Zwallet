//
//  HomeInteractorImpl.swift
//  Home
//
//  Created by Rizky Saputra on 25/05/21.
//

import Foundation
import Core

class HomeInteractorImpl: HomeInteractor {
    
    var interactorOutput: HomeInteractorOutput?
    
    let balanceNetworkManager: BalanceNetworkManager
    let invoiceNetworkManager: InvoiceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager, invoiceNetworkManager: InvoiceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
        self.invoiceNetworkManager = invoiceNetworkManager
    }
    
    func getUserProfile() {
        self.balanceNetworkManager.getBalance { (data, error) in
            
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: "\(AppConstant.baseUrl)\(balance.image)")
                UserDefaultHelper.shared.set(key: .balance, value: balance.balance)
                self.interactorOutput?.loadedUserProfileData(userProfile: userProfile)
            }
        }
    }
    
    func getTransaction() {
        self.invoiceNetworkManager.getThisWeekinvoice { (rawData, error) in
            var transaction: [TransactionEntity] = []
            
            guard let dataResponse = rawData else {
                UserDefaultHelper.shared.remove(key: .userToken)
                self.interactorOutput?.toLoginView()
                return
            }
            
            if dataResponse.status != 200 {
                UserDefaultHelper.shared.remove(key: .userToken)
                self.interactorOutput?.toLoginView()
                return
            }
            
            let data = dataResponse.data
            
            data.forEach({ (invoiceData) in
                transaction.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))
                
            })
            self.interactorOutput?.loadedTransaction(transactions: transaction)
        }
    }
}
