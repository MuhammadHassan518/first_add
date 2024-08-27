//
//  SignUpVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 12/07/2024.
//

import UIKit
import SwiftMessages

class SignUpVC: UIViewController {
    
    @IBOutlet weak var imgEmailSelect: UIImageView!
    @IBOutlet weak var imgTickPassword: UIImageView!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var imgLock: UIImageView!
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet var btnBack: UIView!
    @IBOutlet weak var vuEmail: UIView!
    @IBOutlet weak var vuName: UIView!
    @IBOutlet weak var vuPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    
    var isValidations = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setTextDelegates()
    }
    
    func setUI() {
        btnSignUp.layer.cornerRadius = 15
        vuEmail.layer.cornerRadius = vuEmail.frame.height / 2
        vuPassword.layer.cornerRadius = vuPassword.frame.height / 2
        vuName.layer.cornerRadius = vuName.frame.height / 2
        imgEmailSelect.isHidden = true
        imgTickPassword.isHidden = true
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func setTextDelegates() {
        txtName.delegate = self
        txtPassword.delegate = self
        txtEmail.delegate = self
    }
}

//MARK: Buttons Functions

extension SignUpVC {
    
    @IBAction func btnShowPassword(_ sender: Any) { }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnCheck(_ sender: Any) {
        
        btnCheck.isSelected.toggle()
        if btnCheck.isSelected {
            btnCheck.setImage(UIImage(named: "selected_check_box"), for: .normal)
        } else {
            btnCheck.setImage(UIImage(named: "unselected_check_box"), for: .selected)
        }
    }
    
    @IBAction func onBtnSignUp(_ sender: Any) {
        showSuccessAlert(title: "Success", message: "Your account has been successfully registered", btnTitle: "Login")
    }
    
    @IBAction func onBtnTerms(_ sender: Any) { }
    
    @IBAction func onBtnPrivcy(_ sender: Any) { }
    
    @IBAction func onBtnLogin(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

//MARK: TextDelegates Functions

extension SignUpVC {
    func showSuccessAlert(title:String, message:String, btnTitle: String ) -> Void{
        let successAlert = Bundle.main.loadNibNamed("SuccessAlert", owner: self, options: nil)![0] as! SuccessAlert
        successAlert.lblMessage.text = message
        successAlert.lblTitle.text = title
        successAlert.btnLogin.layer.cornerRadius = 20
        successAlert.vuBack.layer.cornerRadius = 20
        successAlert.btnLogin.setTitle(btnTitle, for: .normal)
        successAlert.btnLogin.addTarget(self, action:#selector(self.confirm(_:)), for: .touchUpInside)
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .center
        config.duration = .forever
        config.interactiveHide = true
        config.dimMode = .blur(style: .dark, alpha: 1, interactive: false)
        config.presentationContext = .viewController(self)
        SwiftMessages.show(config: config, view: successAlert)
        
    }
    
    @objc func dismissAlert(_ sender: UIButton){
        SwiftMessages.hide()
    }
    @objc func confirm(_ sender: UIButton){
        SwiftMessages.hide()
        if !isValidations {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let VC = storyBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { return  }
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}

extension SignUpVC : UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == txtName {
            if txtName.text == "" || txtName.text?.count ?? 0 <= 3 {
                isValidations = true
                txtName.becomeFirstResponder()
            }else{
                isValidations = false
                txtName.becomeFirstResponder()
                imgPerson.image = UIImage(named: "person_blue")
            }
        } else if textField  == txtEmail {
            txtEmail.becomeFirstResponder()
            if isValidEmail(email: txtEmail.text ?? "") {
                imgEmailSelect.isHidden = false
                isValidations = false
                imgEmailSelect.image = UIImage(named: "Tick")
                imgEmail.image = UIImage(named: "email_blue")
            }else{
                isValidations = true
            }
        } else {
            txtPassword.becomeFirstResponder()
            if txtPassword.text == "" || txtPassword.text?.count ?? 0 <= 8 {
                isValidations = true
            }else {
                imgTickPassword.isHidden = false
                btnShowPassword.isHidden = true
                isValidations = false
                imgTickPassword.image = UIImage(named: "Tick")
                imgLock.image = UIImage(named: "lock_blue")
            }
        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        if textField == txtName {
        //            imgPerson.image = UIImage(named: "person_blue")
        //            txtName.resignFirstResponder()
        //        } else if textField  == txtEmail {
        //            txtEmail.resignFirstResponder()
        //            imgEmailSelect.isHidden = false
        //            imgEmailSelect.image = UIImage(named: "Tick")
        //        } else {
        //            txtPassword.resignFirstResponder()
        //            imgTickPassword.isHidden = false
        //            btnShowPassword.isHidden = true
        //            imgTickPassword.image = UIImage(named: "Tick")
        //        }
        
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
}
