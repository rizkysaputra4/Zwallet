//
//  AuthApi.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password: String)
    case register(email: String, userName: String, password: String)
    case createPin(pin: String)
    case confirmOtp(email: String, otp: String)
    case refreshToken(email: String, refreshToken: String)
    case checkPin(pin: String)
}

extension AuthApi: TargetType {
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .register:
            return "/auth/signup"
        case .createPin:
            return "/auth/PIN"
        case .confirmOtp(let email, let otp):
            return "/auth/activate/\(email)/\(otp)"
        case .refreshToken:
            return "/auth/refresh-token"
        case .checkPin(let pin):
            return "/auth/checkPIN/\(pin)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login, .register, .refreshToken:
            return .post
        case .createPin:
            return .patch
        case .confirmOtp, .checkPin:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .register(let email, let userName, let password):
            return .requestParameters(parameters: ["email": email, "username": userName, "password": password], encoding: JSONEncoding.default)
        case .createPin(let pin):
            return .requestParameters(parameters: ["PIN": pin], encoding: JSONEncoding.default)
        case .confirmOtp, .checkPin:
            return .requestPlain
        case .refreshToken(let email, let refreshToken):
            return .requestParameters(parameters: ["email": email, "refreshToken": refreshToken], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .login, .register, .confirmOtp:
            return [
                "Content-Type": "application/json"
            ]
        case .createPin, .refreshToken, .checkPin:
            let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }
}
