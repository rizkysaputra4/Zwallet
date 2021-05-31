//
//  StatusViewCell.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core

class StatusViewCell: UITableViewCell {
    
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverPhoneNumber: UILabel!
    
    @IBOutlet weak var transferAmount: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var notes: UILabel!
    
    @IBOutlet weak var customView: CustomView!
    
    var delegate: StatusCellDelegate?
    
    var transferData: MakeTransferEntity?

    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func loadData(isSuccess: Bool) {
        let imageurl = URL(string: transferData?.receiver?.image ?? "")
        
        self.receiverImage.kf.setImage(with: imageurl)
        self.receiverName.text = transferData?.receiver?.name
        self.receiverPhoneNumber.text = transferData?.receiver?.phone
        self.balance.text = transferData?.balance?.formatToIdr()
        self.transferAmount.text = transferData?.amount?.formatToIdr()
        self.date.text = transferData?.date?.toDateTimeFormat()
        self.notes.text = transferData?.notes
        
        if isSuccess {
            self.customView.statusImage.image = UIImage(named: "success", in: Bundle(identifier: "com.casestudy.Transfer"), compatibleWith: nil)
            self.customView.statusLabel.text = "Transaction Success"
        } else {
            self.customView.statusImage.image = UIImage(named: "failed", in: Bundle(identifier: "com.casestudy.Transfer"), compatibleWith: nil)
            self.customView.statusLabel.text = "Transaction Failed"
        }

    }
    
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.toRootBack()
    }
    
}
