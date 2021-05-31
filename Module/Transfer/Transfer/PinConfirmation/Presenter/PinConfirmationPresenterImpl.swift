//
//  PinConfirmationPresenterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class PinConfirmationPresenterImpl: PinConfirmationPresenter {

    let view: PinConfirmationView
    let interactor: PinConfirmationInteractor
    let router: PinConfirmationRouter
    
    init(view: PinConfirmationView, interactor: PinConfirmationInteractor, router: PinConfirmationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigateToBack(vc: UIViewController) {
        self.router.navigateToBack(vc: vc)
    }
    
    func loadData() {
        self.interactor.loadData()
    }
    
    func postTransfer(data: MakeTransferEntity, vc: UIViewController) {
        self.interactor.postTransfer(data: data, vc: vc)
    }
    
}

extension PinConfirmationPresenterImpl: PinConfirmationInteractorOutput {

    
    func pinConfirmationOutput(isSuccess: Bool, message: String, data: MakeTransferEntity, response: TransferReceive?, vc: UIViewController) {
        
        self.router.navigateToTransactionStatus(vc: vc, response: response, data: data)
  
    }
    
    
    func loadTransferData(data: MakeTransferEntity) {
        self.view.showData(data: data)
    }
}
