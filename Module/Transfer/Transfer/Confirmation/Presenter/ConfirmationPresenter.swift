//
//  ConfirmationPresenter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol ConfirmationPresenter {
    func navigateToBack(vc: UIViewController)
    func loadData()
    func navigateToPinConfirmation(vc: UIViewController, data: MakeTransferEntity)
}
