//
//  CreatePinCustomView.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import UIKit
import Core

class CreatePinCustomView: UIView {

    @IBOutlet weak var pinInput1: UITextField!
    @IBOutlet weak var pinInput2: UITextField!
    @IBOutlet weak var pinInput3: UITextField!
    @IBOutlet weak var pinInput4: UITextField!
    @IBOutlet weak var pinInput5: UITextField!
    @IBOutlet weak var pinInput6: UITextField!
    
    var nibName = "CreatePinCustomView"
    
    @IBOutlet var view : UIView!
    
    var delegate: CreatePinCustomCellViewDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
    }

    func xibSetUp() {
        view = loadViewFromNib(nibName: self.nibName)
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }

    func loadViewFromNib(nibName: String) -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView

    }
    
    func changeXib(nibName: String) {
        view = loadViewFromNib(nibName: nibName)
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }

    @IBAction func confirmPinAction(_ sender: Any) {
        
        self.delegate?.submitPin(pin: getTextInputField())
    }
    
    @IBAction func confirmOTPAction(_ sender: Any) {
        let email: String = UserDefaultHelper.shared.get(key: .userEmail) ?? ""
        self.delegate?.submitOtp(email: email, otp: getTextInputField())
    }
    
    @IBAction func toLoginSceneAction(_ sender: Any) {
        self.delegate?.showLoginScene()
    }
    
    func getTextInputField() -> String {
        let pin1 = pinInput1.text ?? ""
        let pin2 = pinInput2.text ?? ""
        let pin3 = pinInput3.text ?? ""
        let pin4 = pinInput4.text ?? ""
        let pin5 = pinInput5.text ?? ""
        let pin6 = pinInput6.text ?? ""
        
        return "\(pin1)\(pin2)\(pin3)\(pin4)\(pin5)\(pin6)"
    }
}
