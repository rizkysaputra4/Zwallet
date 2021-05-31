//
//  GetBalanceNetwork.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation

public struct GetBalanceResponse: Codable {
    var status: Int
    var message: String
    var data: [GetBalanceDataResponse]
}
