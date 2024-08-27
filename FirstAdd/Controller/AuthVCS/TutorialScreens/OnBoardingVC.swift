//
//  OnBoardingVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 12/07/2024.
//

import UIKit

class OnBoardingVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    let r: CGFloat = 0x19 / 255.0
    let g: CGFloat = 0x76 / 255.0
    let b: CGFloat = 0xD2 / 255.0
    var isComingFromLogout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        btnLogin.layer.cornerRadius = btnLogin.frame.height / 2
        btnSignUp.layer.cornerRadius = btnSignUp.frame.height / 2
        btnSignUp.layer.borderWidth = 1
        btnSignUp.layer.borderColor = CGColor(red: r, green: g, blue: b, alpha: 1.0)
        if isComingFromLogout {
            btnBack.isHidden = true
            btnSkip.isHidden = true
        }
    }
    
    @IBAction func onBtnSkip(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let onBordVC = storyBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { return  }
        self.navigationController?.pushViewController(onBordVC, animated: true)
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    @IBAction func onBtnLogin(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { return  }
        self.navigationController?.pushViewController(VC, animated: true)
    }
    

}
