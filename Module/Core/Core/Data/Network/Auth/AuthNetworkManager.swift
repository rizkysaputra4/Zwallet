//
//  AuthNetworkManager.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation

public protocol AuthNetworkManager {
    func login(email: String, pasword: String, completion: @escaping (LoginResponse?, Error?) -> ())
    
    func register(email: String, userName: String, password: String, completion: @escaping (RegisterResponse?, Error?) -> ())
    
    func createPin(pin: String, completion: @escaping (CreatePinResponse?, Error?) -> ())
    
    func confirmOtp(email: String, otp: String, completion: @escaping (CommonResponse?, Error?) -> ())
    
    func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenDataResponse?, Error?) -> ())
    
    func checkPin(pin: String, completion: @escaping (CommonResponse?, Error?) -> ())
}
