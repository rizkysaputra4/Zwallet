//
//  PinConfirmationViewCell.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import UIKit
import Core
import SkeletonView

class PinConfirmationViewCell: UITableViewCell {
    
    @IBOutlet weak var pin1: UITextField!
    @IBOutlet weak var pin2: UITextField!
    @IBOutlet weak var pin3: UITextField!
    @IBOutlet weak var pin4: UITextField!
    @IBOutlet weak var pin5: UITextField!
    @IBOutlet weak var pin6: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    var delegate: PinConfirmationCellDelegate?
    
    var transferData: MakeTransferEntity?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
       
        isFilled()
        pin1.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        pin2.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        pin3.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        pin4.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        pin5.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        pin6.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func didChange(_ textField: UITextField) {
        self.pin1.numberOnly()
        self.pin2.numberOnly()
        self.pin3.numberOnly()
        self.pin4.numberOnly()
        self.pin5.numberOnly()
        self.pin6.numberOnly()
        isFilled()
    }
    
    
    func isFilled() {
        let isPin1Empty = pin1.text?.isEmpty ?? true
        let isPin2Empty = pin2.text?.isEmpty ?? true
        let isPin3Empty = pin3.text?.isEmpty ?? true
        let isPin4Empty = pin4.text?.isEmpty ?? true
        let isPin5Empty = pin5.text?.isEmpty ?? true
        let isPin6Empty = pin6.text?.isEmpty ?? true


        if  isPin1Empty || isPin2Empty || isPin3Empty || isPin4Empty || isPin5Empty || isPin6Empty {
            continueBtn.isEnabled = false
            continueBtn.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            continueBtn.layer.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 0.8470588235)
            continueBtn.isEnabled = true
        }
    }
    
    func startLoading() {
        [self.pin1, self.pin2, self.pin3, self.pin4, self.pin5, self.pin6, self.continueBtn].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    func stopLoading() {
        [self.pin1, self.pin2, self.pin3, self.pin4, self.pin5, self.pin6, self.continueBtn].forEach {
            $0?.hideSkeleton()
        }
    }
    
    func loadData() {


    }
    

    @IBAction func backAction(_ sender: Any) {
        self.delegate?.toBack()
    }
    
    @IBAction func transferAction(_ sender: Any) {
        self.startLoading()
        self.transferData?.pin = getTextInputField()
        self.delegate?.confirmTransfer(data: transferData!)
    }
    
    func getTextInputField() -> String {
        let pin1 = self.pin1.text ?? ""
        let pin2 = self.pin2.text ?? ""
        let pin3 = self.pin3.text ?? ""
        let pin4 = self.pin4.text ?? ""
        let pin5 = self.pin5.text ?? ""
        let pin6 = self.pin6.text ?? ""
        
        return "\(pin1)\(pin2)\(pin3)\(pin4)\(pin5)\(pin6)"
    }
    
}
