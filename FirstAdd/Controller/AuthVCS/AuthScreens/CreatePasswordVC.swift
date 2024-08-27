//
//  CreatePasswordVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 15/07/2024.
//

import UIKit

class CreatePasswordVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var btnShowConfirmPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var vuConfirmPassword: UIView!
    @IBOutlet weak var vuPassword: UIView!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var imgConfirmPassword: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI() 
    }

    func setUI() {
        
        btnLogin.layer.cornerRadius = 15
        vuPassword.layer.cornerRadius = vuPassword.frame.height / 2
        vuConfirmPassword.layer.cornerRadius = vuConfirmPassword.frame.height / 2
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnLogin(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
