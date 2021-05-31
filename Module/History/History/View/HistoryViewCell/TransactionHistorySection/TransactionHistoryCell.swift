//
//  TransactionHistoryCell.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import UIKit

class TransactionHistoryCell: UITableViewCell {

    @IBOutlet weak var view: TransactionCellViewManager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setHeader(text: String) {
        view.headerLabel.text = text
    }
    
    func changeView(nibName: String) {
        view.changeXib(nibName: nibName)
    }
    
    func showData(transactionData: TransactionHistoryEntity) {
        view.showData(transactionData: transactionData)
    }
    
    func startLoading() {
        self.view.startLoading()
    }
    
    func stopLoading() {
        self.view.stopLoading()
    }
}
