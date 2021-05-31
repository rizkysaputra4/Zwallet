//
//  StatusPresenter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol StatusPresenter {
    func navigateToBack(vc: UIViewController)
    func loadData()
    func navigateToRoot(vc: UIViewController)
}
