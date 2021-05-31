//
//  SearchReceiverDataResponse.swift
//  Core
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

public struct SearchReceiverDataResponse: Codable {
    
    public var status: Int
    public var message: String
    public var data: [SearchReceiverData]
}
