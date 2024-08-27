//
//  ProfileVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit
import SwiftMessages

class ProfileVC: UIViewController {

    @IBOutlet weak var vuProfiles: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHeartRates: UILabel!
    @IBOutlet weak var lblCalerie: UILabel!
    @IBOutlet weak var lblWeights: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tbView: UITableView!
    
    var tutorialData = [TutorialModel]()
    let profileCell  = CellIdentifiers.profileCell

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDate()
        registerCells()
    }
    
    func registerCells(){
        tbView.register(UINib(nibName: profileCell, bundle: nil), forCellReuseIdentifier: profileCell)
    }
    
    func setDate(){
        tutorialData = [
            TutorialModel(title: "My Saved", image: "blueHeart"),
            TutorialModel(title: "Appointmnet", image: "Document"),
            TutorialModel(title: "Payment Method", image: "card"),
            TutorialModel(title: "FAQs", image: "Chat"),
            TutorialModel(title: "Logout", image: "logout1")
        ]
    }
    
    func setUI() {
        vuProfiles.roundCorners(corners: [.topLeft, .topRight], amount: 20.0)
    }
}

extension ProfileVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tutorialData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCell, for: indexPath) as? ProfileCell
        cell?.selectionStyle = .none
        let data = tutorialData[indexPath.row]
        cell?.img.image = UIImage(named: data.image)
        cell?.lblTitle.text = data.title
        if indexPath.row == tutorialData.count - 1 {
            cell?.lblTitle.textColor = UIColor.red
        }
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            showLogOutAlert()
        }
    }
}

extension ProfileVC {
    func showLogOutAlert() -> Void{
        let successAlert = Bundle.main.loadNibNamed("LogoutPopup", owner: self, options: nil)![0] as! LogoutPopup
        successAlert.btnLogOut.layer.cornerRadius = 20
        successAlert.vuBack.layer.cornerRadius = 20
        successAlert.btnLogOut.addTarget(self, action:#selector(self.confirm(_:)), for: .touchUpInside)
        successAlert.btnCancel.addTarget(self, action:#selector(self.confirm(_:)), for: .touchUpInside)

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
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnBoardingVC") as? OnBoardingVC else { return }
        vc.isComingFromLogout = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
