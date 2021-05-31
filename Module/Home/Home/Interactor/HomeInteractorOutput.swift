//
//  HomeInteractorOutput.swift
//  Home
//
//  Created by Rizky Saputra on 25/05/21.
//

import Foundation
import Core

protocol HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity)
    func loadedTransaction(transactions: [TransactionEntity])
    func toLoginView()
}
