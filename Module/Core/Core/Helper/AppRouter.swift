//
//  AppRouter.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import UIKit

public class AppRouter {
    
    public static let shared: AppRouter = AppRouter()
    
    public var loginScene: (() -> ())? = nil
    
    public var homeScene: (() -> ())? = nil
    

    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public var registerScene: ((_ UIViewController: UIViewController) -> ())? = nil
    
    public var emailVerificationScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public var loginViewScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public var createPinScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public var confirmOtpScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public var transferScene: ((_ viewController: UIViewController) -> ())? = nil
    
    
    
    public func navigateToHome() {
        self.homeScene?()
    }
    
    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
    
    public func navigateToLogin() {
        self.loginScene?()
    }
    
    public func navigateToRegister(_ viewController: UIViewController) {
        self.registerScene?(viewController)
    }
    
    public func navigateToEmailVerification(_ viewController: UIViewController) {
        self.emailVerificationScene?(viewController)
    }
    
    public func navigateToLoginView(_ viewController: UIViewController) {
        self.loginViewScene?(viewController)
    }
    
    public func navigateToCreatePin(_ viewController: UIViewController) {
        self.createPinScene?(viewController)
    }
    
    public func navigateToConfirmOtp(_ viewController: UIViewController) {
        self.confirmOtpScene?(viewController)
    }
    
    public func navigateToTransfer(_ viewController: UIViewController) {
        self.transferScene?(viewController)
    }
}
