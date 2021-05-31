//
//  HomePresenter.swift
//  Home
//
//  Created by Rizky Saputra on 25/05/21.
//

import Foundation
import UIKit

protocol HomePresenter {
    func loadProfile()
    func loadTransaction()
    func showHistory(viewController: UIViewController)
    func logout()
    func toTransferScene(viewController: UIViewController)
}
