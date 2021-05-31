//
//  StatusView.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol StatusView {
    func showData(data: MakeTransferEntity, response: TransferReceive?)
}
