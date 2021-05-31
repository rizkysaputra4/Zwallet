//
//  RefreshTokenResponse.swift
//  Core
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation

struct RefreshTokenResponse: Codable {
    var status: Int
    var message: String
    var data: RefreshTokenDataResponse
}
