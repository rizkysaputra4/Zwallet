//
//  StatusRouter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol StatusRouter {
    func navigateToBack(vc: UIViewController)

    func navigateToRoot(vc: UIViewController)
}
