//
//  SearchReceiver.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

protocol SearchReceiver {
    
    func showError(message: String)
    func showReceiver(receivers: [ReceiverData])
}
