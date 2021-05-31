//
//  SearchReceiverInteractorImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core

class SearchReceiverInteractorImpl: SearchReceiverInteractor {
    
    var interactorOutput: SearchReceiverInteractorOutput?
    var transferNetworkManager: TransferNetworkManager
    
    init(networkManager: TransferNetworkManager) {
        self.transferNetworkManager = networkManager
    }
    
    func searchReceiver(keyword: String) {
        self.transferNetworkManager.searchReceiver(keyword: keyword) { (data, error) in
            
            var searchResult: [ReceiverData] = []
            
            guard let searchData = data else {
                self.interactorOutput?.searchReceiverResult(isSuccess: false, message: "", searchResult: nil)
                return
            }
            
            if searchData.status == 200 {
                
                searchData.data.forEach({ (data) in
                    searchResult.append(ReceiverData(id: data.id, name: data.name, phone: data.phone, image: "\(AppConstant.baseUrl)/\(data.image)"))
                })
                self.interactorOutput?.searchReceiverResult(isSuccess: true, message: "", searchResult: searchResult)

            } else {
                self.interactorOutput?.searchReceiverResult(isSuccess: false, message: searchData.message, searchResult: nil)
            }
        }
    }
    
}

