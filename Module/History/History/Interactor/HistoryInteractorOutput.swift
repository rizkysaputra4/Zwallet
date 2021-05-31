//
//  HistoryInteractorOutpu.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation

protocol HistoryInteractorOutput {
    func loadedTransaction(transactions: [TransactionHistoryEntity])
    func toHome()
}
