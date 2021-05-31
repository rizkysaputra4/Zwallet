//
//  TransferReceive.swift
//  Core
//
//  Created by Rizky Saputra on 30/05/21.
//

import Foundation

public struct TransferReceive: Codable {
    
    var sender: Int
    var receiver: Int
    var notes: String
    var amount: Double
    var createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case sender, receiver, notes, amount
        case createdAt = "created_at"
    }
}
