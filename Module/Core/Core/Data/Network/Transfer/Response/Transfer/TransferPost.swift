//
//  TransferEntity.swift
//  Core
//
//  Created by Rizky Saputra on 30/05/21.
//

import Foundation

public struct TransferEntity: Codable {
    
    public var receiver: Int
    public var amount: Double
    public var notes: String
    public var pin: String
    
    public init(receiver: Int, amount: Double, notes: String, pin: String) {
        self.receiver = receiver
        self.amount = amount
        self.notes = notes
        self.pin = pin
    }
    
}
