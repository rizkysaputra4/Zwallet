//
//  TransferNetworkManager.swift
//  Core
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

public protocol TransferNetworkManager {
    
    func searchReceiver(keyword: String, completion: @escaping (SearchReceiverDataResponse?, Error?) -> ())
    
    func transfer(data: TransferEntity, completion: @escaping (TransferResponse?, Error?) -> ())
    
}
