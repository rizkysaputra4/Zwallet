//
//  TransferApi.swift
//  Core
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Moya

public enum TransferApi {
    case searchReceiver(keyword: String)
    case transfer(data: TransferEntity)
}

extension TransferApi: TargetType {
    public var baseURL: URL {
        return URL(string: "\(AppConstant.baseUrl)/tranfer")!
    }
    
    public var path: String {
        switch self {
        case .searchReceiver:
            return "/search"
        case .transfer:
            return "/newTranfer"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchReceiver: return .get
        case .transfer: return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .searchReceiver(let keyword):
            return .requestParameters(parameters: ["name": keyword], encoding: URLEncoding.default)
        case .transfer(let data):
            return .requestParameters(
                parameters: [
                    "receiver": data.receiver,
                    "amount": data.amount,
                    "notes": data.notes
                ],
                encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .searchReceiver:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        case .transfer(let data):
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",
                "x-access-PIN": data.pin
            ]
        }
    }
}
