//
//  CreatePinCell.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import UIKit

class CreatePinCell: UITableViewCell {
    
//    var presenter: CreatePinPresenter?
    @IBOutlet weak var customView: CreatePinCustomView!
    
    
    var delegate: CreatePinCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        customView.delegate = self
        // Initialization code
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func createPinSuccessView() {
        customView.changeXib(nibName: "PinCreatedCustomView")
    }
    
}

extension CreatePinCell: CreatePinCustomCellViewDelegate {
    func submitOtp(email: String, otp: String) {
        self.delegate?.submitOtp(email: email, otp: otp)
    }
    
    
    func submitPin(pin: String) {
        self.delegate?.submitPin(pin: pin)
    }
    
    func showLoginScene() {
        self.delegate?.showLoginScene()
    }
    
}

