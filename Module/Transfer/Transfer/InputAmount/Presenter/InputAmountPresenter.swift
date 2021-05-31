//
//  InputAmountPresenter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol InputAmountPresenter {
    func navigateToConfirmation(vc: UIViewController ,transferData: MakeTransferEntity)
    func toBack(vc: UIViewController)
    func loadData()
}
