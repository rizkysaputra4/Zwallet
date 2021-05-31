//
//  ReceiverResultCell.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Kingfisher
import Core
import SkeletonView

class ReceiverResultCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var receiverPhoneNumberLabel: UILabel!
    
    var delegate: ReceiverResultCellDelegate?
    
    var receiver = ReceiverData(id: 0, name: "", phone: "", image: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.cellTapped(_:)))
        cellView.addGestureRecognizer(tap)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer? = nil) {
        var transferData = MakeTransferEntity(receiver: self.receiver, amount: 0, notes: "", pin: "")
        
        let balance = UserDefaultHelper.shared.get(key: .balance) ?? 0.00
        transferData.balance = balance
        transferData.date = Date()
        
        self.delegate?.toInputAmount(transferData: transferData)
    }
    
    func showData(data: ReceiverData) {
        self.receiver = data
        self.receiverNameLabel.text = self.receiver.name
        self.receiverPhoneNumberLabel.text = data.phone
        
        let imageUrl = URL(string: data.image)
        self.receiverImage.kf.setImage(with: imageUrl)
    }
    
    func startLoading() {
        [self.receiverImage, self.receiverNameLabel, self.receiverPhoneNumberLabel].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    func stopLoading() {
        [self.receiverImage, self.receiverNameLabel, self.receiverPhoneNumberLabel].forEach {
            $0?.hideSkeleton()
        }
    }
}
