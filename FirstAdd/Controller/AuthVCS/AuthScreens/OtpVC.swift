//
//  OtpVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 15/07/2024.
//

import UIKit

class OtpVC: UIViewController {
    
    @IBOutlet weak var txt1: SingleDigitField!
    @IBOutlet weak var txt2: SingleDigitField!
    @IBOutlet weak var txt3: SingleDigitField!
    @IBOutlet weak var txt4: SingleDigitField!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var btnResend: UIButton!
    let borderColor = CGColor(red: 25/255, green: 118/255, blue: 210/255, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        [txt1, txt2, txt3, txt4].forEach {
            $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        // Make the first digit field the first responder
        txt1.isUserInteractionEnabled = true
        txt1.becomeFirstResponder()
        btnVerify.layer.cornerRadius = 15
    }
    
    @objc func editingChanged(_ textField: SingleDigitField) {
        // Check if the deleteBackwards key was pressed
        if textField.pressedDelete {
            // Reset its state
            textField.pressedDelete = false
            // If the field has text, empty its content
            if textField.hasText {
                textField.text = ""
                setBorderFree(textField: textField)
            } else {
                // Otherwise switch the field, activate the previous field, and empty its contents
                switch textField {
                case txt2:
                    txt1.isUserInteractionEnabled = true
                    txt1.becomeFirstResponder()
                    txt1.text = ""
                    setBorderFree(textField: txt1)
                case txt3:
                    txt2.isUserInteractionEnabled = true
                    txt2.becomeFirstResponder()
                    txt2.text = ""
                    setBorderFree(textField: txt2)
                case txt4:
                    txt3.isUserInteractionEnabled = true
                    txt3.becomeFirstResponder()
                    txt3.text = ""
                    setBorderFree(textField: txt3)
                default:
                    break
                }
            }
        } else {
            // Make sure there is only one character and it is a number; otherwise delete its contents
            guard textField.text?.count == 1, textField.text?.last?.isWholeNumber == true else {
                textField.text = ""
                return
            }
            // Switch the text field and make the next field active
            switch textField {
            case txt1:
                txt2.isUserInteractionEnabled = true
                txt2.becomeFirstResponder()
                setBorder(textField: txt1)
            case txt2:
                txt3.isUserInteractionEnabled = true
                txt3.becomeFirstResponder()
                setBorder(textField: txt2)
            case txt3:
                txt4.isUserInteractionEnabled = true
                txt4.becomeFirstResponder()
                setBorder(textField: txt3)
            case txt4:
                txt4.resignFirstResponder()
                setBorder(textField: txt4)
            default:
                break
            }
        }
    }
    
    func setBorder(textField: SingleDigitField ){
        textField.layer.borderColor = borderColor
        textField.layer.borderWidth = 4
    }
    
    func setBorderFree(textField: SingleDigitField ){
        textField.layer.borderColor = borderColor
        textField.layer.borderWidth = 0
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnResend(_ sender: Any) {
        
    }
    
    @IBAction func onBtnVerify(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "CreatePasswordVC") as? CreatePasswordVC else { return }
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
