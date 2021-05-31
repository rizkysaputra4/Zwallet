//
//  HistoryView.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation
import Core
import UIKit

protocol HistoryView {
    func showTransactionData(transactions: [TransactionHistoryEntity])
    func toHome()
}
