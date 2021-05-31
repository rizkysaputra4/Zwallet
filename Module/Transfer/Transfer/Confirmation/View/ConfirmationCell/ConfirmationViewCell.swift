//
//  ConfirmationViewCell.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core

class ConfirmationViewCell: UITableViewCell {
    
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverPhoneNumber: UILabel!
    
    @IBOutlet weak var transferAmount: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var notes: UILabel!
    
    var delegate: ConfirmationCellDelegate?
    
    var transferData: MakeTransferEntity?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func loadData() {
        let imageurl = URL(string: transferData?.receiver?.image ?? "")
        
        self.receiverImage.kf.setImage(with: imageurl)
        self.receiverName.text = transferData?.receiver?.name
        self.receiverPhoneNumber.text = transferData?.receiver?.phone
        self.balance.text = transferData?.balance?.formatToIdr()
        self.transferAmount.text = transferData?.amount?.formatToIdr()
        self.date.text = transferData?.date?.toDateTimeFormat()
        self.notes.text = transferData?.notes

    }
    
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.toBack()
    }
    
    @IBAction func continueAction(_ sender: Any) {
        self.delegate?.confirmTransfer(data: transferData!)
    }
}
