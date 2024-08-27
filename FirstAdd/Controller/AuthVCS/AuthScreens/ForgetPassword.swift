//
//  ForgetPassword.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 15/07/2024.
//

import UIKit

class ForgetPassword: UIViewController {

    @IBOutlet weak var vuEmail: UIView!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var imgTick: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgEmailPhone: UIImageView!
    @IBOutlet weak var btnResetPassword: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        btnPhone.tintColor = UIColor(named: "grayColor")
        btnEmail.tintColor = UIColor(named: "BlueColor")
        btnResetPassword.layer.cornerRadius = 15
        btnPhone.layer.cornerRadius = btnPhone.frame.height / 2
        btnEmail.layer.cornerRadius = btnEmail.frame.height / 2
        vuEmail.layer.cornerRadius = vuEmail.frame.height / 2
        imgTick.isHidden = true
        
    }
    
    @IBAction func onBtnEmail(_ sender: Any) {
        btnEmail.tintColor = UIColor(named: "BlueColor")
        btnPhone.tintColor = UIColor(named: "grayColor")
        imgEmailPhone.image = UIImage(named: "email_blue_Line")
    }
    
    @IBAction func onBtnPhone(_ sender: Any) {
        btnEmail.tintColor = UIColor(named: "grayColor")
        btnPhone.tintColor = UIColor(named: "BlueColor")
        imgEmailPhone.image = UIImage(systemName: "phone.down")
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnResetPassword(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "OtpVC") as? OtpVC else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
