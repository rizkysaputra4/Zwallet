//
//  HistoryPresenter.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation
import UIKit

protocol HistoryPresenter {
    func loadTransaction()
    func filterBy()
    func navigateToHome(viewController: UIViewController)
}
