//
//  AuthNetworkManagerImpl.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager {

    public init() {
        
    }
    
    public func login(email: String, pasword: String, completion: @escaping (LoginResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.login(email: email, password: pasword)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: result.data)
                    completion(loginResponse, nil)
                    
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func register(email: String, userName: String, password: String, completion: @escaping (RegisterResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.register(email: email, userName: userName , password: password)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let registerResponse = try decoder.decode(RegisterResponse.self, from: result.data)
                    completion(registerResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func createPin(pin: String, completion: @escaping (CreatePinResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(isRefreshToken: true)
        provider.request(.createPin(pin: pin)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let createPinResponse = try decoder.decode(CreatePinResponse.self, from: result.data)
                    completion(createPinResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func checkPin(pin: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(isRefreshToken: true)
        provider.request(.checkPin(pin: pin)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let createPinResponse = try decoder.decode(CommonResponse.self, from: result.data)
                    completion(createPinResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func confirmOtp(email: String, otp: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.confirmOtp(email: email, otp: otp)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let confirmOtpResponse = try decoder.decode(CommonResponse.self, from: result.data)
                    completion(confirmOtpResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.refreshToken(email: email, refreshToken: refreshToken)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let refreshTokenResponse = try decoder.decode(RefreshTokenResponse.self, from: result.data) as RefreshTokenResponse
                    completion(refreshTokenResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
