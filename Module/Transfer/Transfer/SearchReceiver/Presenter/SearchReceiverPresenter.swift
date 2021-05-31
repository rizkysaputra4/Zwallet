//
//  SearchReceiverPresenter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol SearchReceiverPresenter {
    func searchReceiver(keyword: String)
    func toInputAmountScene(viewController: UIViewController, transferData: MakeTransferEntity)
}
