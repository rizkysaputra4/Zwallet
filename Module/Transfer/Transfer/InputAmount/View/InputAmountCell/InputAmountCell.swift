//
//  InputAmountCell.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Kingfisher

class InputAmountCell: UITableViewCell {
    
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverPhoneNumber: UILabel!
    @IBOutlet weak var currnetBalance: UILabel!
    
    @IBOutlet weak var transferedAmountInput: UITextField!
    @IBOutlet weak var noteInput: UITextField!
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    var delegate: InputAmountCellDelegate?
    
    var transferData: MakeTransferEntity?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        
        isFilled()
        transferedAmountInput.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didChange(_ textField: UITextField) {
        self.transferedAmountInput.numberOnly()
        isFilled()
    }
    
    func isFilled() {
        let isDescriptionEmty = transferedAmountInput.text?.isEmpty ?? true


        if  isDescriptionEmty {
            confirmBtn.isEnabled = false
            confirmBtn.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            confirmBtn.layer.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 0.8470588235)
            confirmBtn.isEnabled = true
        }
    }
    
    func loadData() {
        self.receiverName.text = transferData?.receiver?.name ?? ""
        self.receiverPhoneNumber.text = transferData?.receiver?.phone ?? ""
        self.currnetBalance.text = "\(transferData?.balance?.formatToIdr() ?? "Rp. 0") Available"
        let imageUrl = URL(string: transferData?.receiver?.image ?? "")
        self.receiverImage.kf.setImage(with: imageUrl)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.toBack()
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        let amount = Double(transferedAmountInput.text ?? "0") ?? 0.00
        
        guard var transfer = transferData else {
            self.delegate?.showError(message: "Receiver is Empty")
            return
        }
        transfer.amount = amount
        transfer.notes = self.noteInput.text ?? ""
        transfer.date = Date()
        
        self.delegate?.submitAmount(data: transfer)
    }
}
