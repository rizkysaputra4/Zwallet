//
//  TransferResponse.swift
//  Core
//
//  Created by Rizky Saputra on 30/05/21.
//

import Foundation

public struct TransferResponse: Codable {
    
    public var status: Int
    public var message: String
    public var details: TransferReceive
}
