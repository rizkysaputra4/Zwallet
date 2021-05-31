//
//  ConfirmationPresenter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol PinConfirmationPresenter {
    func navigateToBack(vc: UIViewController)
    func loadData()
    func postTransfer(data: MakeTransferEntity, vc: UIViewController)
}
