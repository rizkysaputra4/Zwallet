//
//  RegisterCell.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import UIKit
import SkeletonView

class RegisterCell: UITableViewCell {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var createLabel: UITextView!
    @IBOutlet weak var signupLabel: UILabel!
    
    var isSecured = true
    
    var presenter: RegisterPresenter?
    var delegate: RegisterCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        isFilled()
        userNameText.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        emailText.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(self.didChange(_:)), for: .editingChanged)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didChange(_ textField: UITextField) {
        isFilled()
    }
    
    func isFilled() {
        let isDescriptionEmty = emailText.text?.isEmpty ?? true
        let isTotalEmpty = passwordText.text?.isEmpty ?? true

        if  isDescriptionEmty || isTotalEmpty {
            signupBtn.isEnabled = false
            signupBtn.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            signupBtn.layer.backgroundColor = #colorLiteral(red: 0.4625302553, green: 0.5670406818, blue: 0.9667261243, alpha: 0.8470588235)
            signupBtn.isEnabled = true
        }
    }
    
    func startLoading() {
        [self.userNameText, self.emailText, self.passwordText, self.signupBtn, self.createLabel, self.signupLabel].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    func stopLoading() {
        [self.userNameText, self.emailText, self.passwordText, self.signupBtn, self.createLabel, self.signupLabel].forEach {
            $0?.hideSkeleton()
        }
    }
    
    func loadStyle() {
        self.passwordText.isSecureTextEntry = self.isSecured
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let email: String = emailText.text ?? ""
        let userName: String = userNameText.text ?? ""
        let password: String = passwordText.text ?? ""
        self.delegate?.signUp(email: email, userName: userName, password: password)
        self.startLoading()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.delegate?.toLogin()
    }
    
    @IBAction func iconAction(sender: AnyObject) {
        self.isSecured = !self.isSecured
        self.loadStyle()
    }
    
}
