//
//  SearchReceiverRouter.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

protocol SearchReceiverRouter {
    
    func navigateToInputAmount(viewController: UIViewController, transferData: MakeTransferEntity)
}
