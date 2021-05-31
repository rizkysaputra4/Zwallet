//
//  TransactionEntity.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation

struct TransactionHistoryEntity {
//    var id: Int
//    var sender: Int
//    var reveiver: Int
    var name: String
    var image: String
    var type: String
    var amount: Double
    var notes: String
    var createdAt: String
    
    public init(name: String, type: String, imageUrl: String, amount: Int, notes: String, createdAt: String) {
        self.name = name
        self.type = type
        self.image = imageUrl
        self.amount = Double(amount)
        self.notes = notes
        self.createdAt = createdAt
    }

}
