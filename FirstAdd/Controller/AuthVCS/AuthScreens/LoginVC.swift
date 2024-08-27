//
//  LoginVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 12/07/2024.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var vuEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var vuPassword: UIView!
    @IBOutlet weak var vuGoogleSignIn: UIView!
    @IBOutlet weak var vuAppleSignIn: UIView!
    @IBOutlet weak var vuFacebookSignIn: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        btnLogin.layer.cornerRadius = 15
        vuEmail.layer.cornerRadius = vuEmail.frame.height / 2
        vuPassword.layer.cornerRadius = vuPassword.frame.height / 2
        vuGoogleSignIn.layer.cornerRadius = vuGoogleSignIn.frame.height / 2
        vuFacebookSignIn.layer.cornerRadius = vuFacebookSignIn.frame.height / 2
        vuAppleSignIn.layer.cornerRadius = vuAppleSignIn.frame.height / 2
    }
    
    
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func onBtnLogin(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        if let tabBarController = storyBoard.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController {
                    self.navigationController?.pushViewController(tabBarController, animated: true)
                }
    }
    
    @IBAction func onBtnForgetPassword(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "ForgetPassword") as? ForgetPassword else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func onBtnSignUp(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    
    
}
