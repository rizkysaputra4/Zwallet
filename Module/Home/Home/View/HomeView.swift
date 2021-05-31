//
//  HomeView.swift
//  Home
//
//  Created by Rizky Saputra on 25/05/21.
//

import Foundation
import Core

protocol HomeView {
    func showUserProfileData(userProfile: UserProfileEntity)
    func showTransactionData(transactions: [TransactionEntity])
    func showLoginView()
}
