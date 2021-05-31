//
//  ConfirmOtpCell.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import UIKit
import Core

class ConfirmOtpCell: UITableViewCell {
    
    
    @IBOutlet weak var otpText1: UITextField!
    @IBOutlet weak var otpText2: UITextField!
    @IBOutlet weak var otpText3: UITextField!
    @IBOutlet weak var otpText4: UITextField!
    @IBOutlet weak var otpText5: UITextField!
    @IBOutlet weak var otpText6: UITextField!
    
    @IBOutlet weak var confirmBtn: UIButton!
    var delegate: ConfirmOtpCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        isFilled()
        otpText1.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        otpText2.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        otpText3.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        otpText4.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        otpText5.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        otpText6.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didChange(_ textField: UITextField) {
        isFilled()
    }
    
    func isFilled() {
        let isOtp1Empty = otpText1.text?.isEmpty ?? true
        let isOtp2Empty = otpText2.text?.isEmpty ?? true
        let isOtp3Empty = otpText3.text?.isEmpty ?? true
        let isOtp4Empty = otpText4.text?.isEmpty ?? true
        let isOtp5Empty = otpText5.text?.isEmpty ?? true
        let isOtp6Empty = otpText6.text?.isEmpty ?? true
 

        if  isOtp1Empty || isOtp2Empty || isOtp3Empty || isOtp4Empty || isOtp5Empty || isOtp6Empty{
            confirmBtn.isEnabled = false
            confirmBtn.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            confirmBtn.layer.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 0.8470588235)
            confirmBtn.isEnabled = true
        }
    }

    
    @IBAction func confirmOtpAction(_ sender: Any) {
        let email: String = UserDefaultHelper.shared.get(key: .userEmail) ?? ""
        self.delegate?.submitConfirmOtp(email: email, otp: getTextInputField())
    }
    
    func getTextInputField() -> String {
        let pin1 = otpText1.text ?? ""
        let pin2 = otpText2.text ?? ""
        let pin3 = otpText3.text ?? ""
        let pin4 = otpText4.text ?? ""
        let pin5 = otpText5.text ?? ""
        let pin6 = otpText6.text ?? ""
        
        return "\(pin1)\(pin2)\(pin3)\(pin4)\(pin5)\(pin6)"
    }
}
