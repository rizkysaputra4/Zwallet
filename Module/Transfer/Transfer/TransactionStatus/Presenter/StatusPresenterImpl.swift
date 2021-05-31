//
//  StatusPresenterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class StatusPresenterImpl: StatusPresenter {

    let view: StatusView
    let interactor: StatusInteractor
    let router: StatusRouter
    
    init(view: StatusView, interactor: StatusInteractor, router: StatusRouter) {
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
    
    func navigateToRoot(vc: UIViewController) {
        self.router.navigateToRoot(vc: vc)
    }
    
}

extension StatusPresenterImpl: StatusInteractorOutput {
    
    func loadTransferData(data: MakeTransferEntity, response: TransferReceive?) {
        self.view.showData(data: data, response: response)
    }
}
