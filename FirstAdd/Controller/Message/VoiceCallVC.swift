//
//  VoiceCallVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 25/07/2024.
//

import UIKit

class VoiceCallVC: UIViewController {
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnMice: UIButton!
    @IBOutlet weak var btnSwipeUp: UIButton!
    @IBOutlet weak var btnVideoCall: UIButton!
    @IBOutlet weak var btnVoiceCall: UIButton!
    @IBOutlet weak var imgMyProfile: UIImageView!
    @IBOutlet weak var imgOtherUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizerDown.direction = .up
        btnSwipeUp.addGestureRecognizer(swipeGestureRecognizerDown)

    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
                UIView.animate(withDuration: 0.3, animations: {
                    self.btnSwipeUp.transform = CGAffineTransform(translationX: 0, y: -100)
                    self.btnSwipeUp.alpha = 0
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.btnSwipeUp.transform = CGAffineTransform(translationX: 0, y: -200)
                    }, completion: { _ in
                        self.navigationController?.popViewController(animated: true)
                    })
                })
            }
    }
    
    
    @IBAction func onBtnSwipeUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnVideoCall(_ sender: Any) {
    }
    
    @IBAction func onBtnVoiceCall(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnMice(_ sender: Any) {
    }
    
}
