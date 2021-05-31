//
//  TransferNetworkManagerImpl.swift
//  Core
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Moya

public class TransferNetworkManagerImpl: TransferNetworkManager {

    public init() {
        
    }
    
    public func searchReceiver(keyword: String, completion: @escaping (SearchReceiverDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>(isRefreshToken: true)
        provider.request(.searchReceiver(keyword: keyword)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let searchReceiverResponse = try decoder.decode(SearchReceiverDataResponse.self, from: result.data)
                    completion(searchReceiverResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func transfer(data: TransferEntity, completion: @escaping (TransferResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>(isRefreshToken: true)
        provider.request(.transfer(data: data)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                decoder.dateDecodingStrategy = .formatted(formatter)
               
                do {
                    let transferResponse = try decoder.decode(TransferResponse.self, from: result.data)
                    completion(transferResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
