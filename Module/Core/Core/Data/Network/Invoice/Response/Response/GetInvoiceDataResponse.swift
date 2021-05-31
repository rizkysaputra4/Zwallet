//
//  GetInvoiceDataResponse.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation

public struct GetInvoiceDataResponse: Codable {
    public var id: Int
    public var sender: Int
    public var receiver: Int
    public var name: String
    public var phone: String
    public var image: String
    public var type: String
    public var amount: Int
    public var notes: String
    public var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case sender
        case receiver
        case name
        case phone
        case image
        case type
        case amount
        case notes
        case createdAt = "created_at"
    }
}
