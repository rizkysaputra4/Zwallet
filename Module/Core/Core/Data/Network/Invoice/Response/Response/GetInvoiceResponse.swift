//
//  GetInvoiceResponse.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation

public struct GetInvoiceResponse: Codable {
    public var status: Int
    public var message: String
    public var data: [GetInvoiceDataResponse]
}
