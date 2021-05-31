//
//  FindReceiverCell.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit

class FindReceiverCell: UITableViewCell {
    
    @IBOutlet weak var receiverKeywordInput: UITextField!
    
    var delegate: FindReceiverCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.toBack()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        self.delegate?.searchReceiver(keyword: receiverKeywordInput.text ?? "")
    }
    
}
