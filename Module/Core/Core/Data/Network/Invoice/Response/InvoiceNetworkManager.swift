//
//  InvoiceNetworkManager.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation

public protocol InvoiceNetworkManager {
    func getThisWeekinvoice(completion: @escaping (GetInvoiceResponse?, Error?) -> ())
    func getAllInvocice(completion: @escaping(GetInvoiceResponse?, Error?) -> ())
}
