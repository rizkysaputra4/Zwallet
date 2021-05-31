//
//  ReceiverData.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation

public struct ReceiverData {

    public var id: Int
    public var name: String
    public var phone: String
    public var image: String
    
    init(id: Int, name: String, phone: String, image: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.image = image
    }
}
