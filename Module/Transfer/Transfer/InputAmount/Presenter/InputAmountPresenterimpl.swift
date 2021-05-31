//
//  InputAmountPresenterimpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

class InputAmountPresenterImpl: InputAmountPresenter {

    var view: InputAmountView
    let interactor: InputAmountInteractor
    let router: InputAmountRouter
    
    init(view: InputAmountView, interactor: InputAmountInteractor, router: InputAmountRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigateToConfirmation(vc: UIViewController, transferData: MakeTransferEntity) {
        self.router.navigateToConfirmation(vc: vc, transferData: transferData)
    }
    
    func toBack(vc: UIViewController) {
        self.router.navigateToBack(vc: vc)
    }
    
    func loadData() {
        self.interactor.loadData()
    }

}

extension InputAmountPresenterImpl: InputAmountInteractorOutput {
    
    func loadTransferData(transferData: MakeTransferEntity) {
        self.view.loadData(makeTransaction: transferData)
    }
    
    func submitAmountResult(isSuccess: Bool, message: String) {
        
    }
}
