//
//  SearchReceiverInteractorOutput.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

protocol SearchReceiverInteractorOutput {
    func searchReceiverResult(isSuccess: Bool, message: String, searchResult: [ReceiverData]?)
}
