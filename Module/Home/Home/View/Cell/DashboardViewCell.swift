//
//  DashboardViewCell.swift
//  Home
//
//  Created by Rizky Saputra on 25/05/21.
//

import UIKit
import SkeletonView

class DashboardViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var transferView: UIView!

    var delegate: DashBoardCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.transferAction(_:)))
        transferView.addGestureRecognizer(tap)
        self.startLoading()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func transferAction(_ sender: UITapGestureRecognizer? = nil) {
        self.delegate?.toTransferScene()
    }
    
    func showData(userProfile: UserProfileEntity) {
        self.nameLabel.text = userProfile.name
        self.balanceLabel.text = userProfile.balance.formatToIder()
        self.phoneNumberLabel.text = userProfile.phoneNumber
        
        let url = URL(string: userProfile.imageUrl)
        self.profileImage.kf.setImage(with: url)
    }
    
    func startLoading() {
        [self.nameLabel, self.balanceLabel, self.phoneNumberLabel, self.profileImage, self.transferView].forEach {
            $0.showAnimatedGradientSkeleton()
        }
    }
    
    func stopLoading() {
        [self.nameLabel, self.balanceLabel, self.phoneNumberLabel, self.profileImage, self.transferView].forEach {
            $0?.hideSkeleton()
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.delegate?.logout()
    }
    
    @IBAction func showAllAction(_ sender: Any) {
        self.delegate?.showAllTransation()
    }
}
