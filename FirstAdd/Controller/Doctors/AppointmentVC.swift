//
//  AppointmentVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 23/07/2024.
//

import UIKit
import SwiftMessages

class AppointmentVC: UIViewController {

    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblSpecilist: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblApontmintDate: UILabel!
    @IBOutlet weak var lblReason: UILabel!
    @IBOutlet weak var lblConsultationFees: UILabel!
    @IBOutlet weak var lblAdminFee1: UILabel!
    @IBOutlet weak var lblAdminFee2: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblPaymentMethod: UILabel!
    @IBOutlet weak var btnBooking: UIButton!
    var doctorData  : DoctorModel?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDoctorsData(data: doctorData!)
    }
    
    
    func setDoctorsData(data: DoctorModel) {
        self.imgDoctor.image = UIImage(named: data.image)
        self.lblDistance.text = data.distance
        self.lblName.text = data.name
        self.lblSpecilist.text = data.specilist
    }
    
    func setUI() {
        btnBooking.layer.cornerRadius = 25
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnChangeBookDate(_ sender: Any) {
    }
    
    @IBAction func onBtnReason(_ sender: Any) {
    }
    
    @IBAction func onBtnChangePaymentMethod(_ sender: Any) {
    }
    
    
    @IBAction func onBtnBooking(_ sender: Any) {
        showSuccessAlert(title: "Success", message: "Your payment has been successful you can have a consultation session with your trusted doctor", btnTitle: "Chat Doctor")

        
    }
    
}
//MARK: TextDelegates Functions

extension AppointmentVC {
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
    }
}
