//
//  ConversationVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 23/07/2024.
//

import UIKit

class ConversationVC: UIViewController {
    
    @IBOutlet weak var btnSendMessage: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var vuMessage: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var messageData = [MessagesModel]()
    let sendMessageCelldentifier = CellIdentifiers.sendMessageCell
    let doctorMessageCell = CellIdentifiers.doctorMessageCell
    var imgDoctor : String?
    var doctorName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCells()
    }
    
    func setUI(){
        lblTitle.text = doctorName
        vuMessage.layer.cornerRadius = 10
        btnSendMessage.layer.cornerRadius = 20
        vuMessage.addShadow()
    }
    
    func registerCells(){
        table.register(UINib(nibName: sendMessageCelldentifier, bundle: nil), forCellReuseIdentifier: sendMessageCelldentifier)
        table.register(UINib(nibName: doctorMessageCell, bundle: nil), forCellReuseIdentifier: doctorMessageCell)
    }
    
    
    
    func setData() {
        messageData = [
            MessagesModel(image: imgDoctor ?? "Dr. John Smith top",
                          name: doctorName ?? "Dr. John Smith",
                          time: "10 min ago",
                          status: true,
                          message: "Hello , How can I help you?",
                          isDoctor: true),
            
            MessagesModel(image: imgDoctor ?? "Dr. John Smith top",
                          name: doctorName ?? "Dr. John Smith",
                          time: "5 min ago",
                          status: true,
                          message: "I have suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain",
                          isDoctor: false),
            
            MessagesModel(image: imgDoctor ?? "Dr. John Smith top",
                          name: doctorName ?? "Dr. John Smith",
                          time: "2 min ago",
                          status: false,
                          message: "Ok, Do you have fever? is the headchace sever",
                          isDoctor: true),
            
            MessagesModel(image: imgDoctor ?? "Dr. John Smith top",
                          name: doctorName ?? "Dr. John Smith",
                          time: "3 min ago",
                          status: false,
                          message: "I don,t have any fever , but headchace is Painfull",
                          isDoctor: false),
            
            MessagesModel(image: imgDoctor ?? "Dr. John Smith top",
                          name: doctorName ?? "Dr. John Smith",
                          time: "1 min ago",
                          status: false,
                          message: "....",
                          isDoctor: true),
        ]
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnAddFiles(_ sender: Any) {
    }
    
    @IBAction func onBtnVoiceCall(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "VoiceCallVC") as? VoiceCallVC else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onBtnVideoCall(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "VideoCallVC") as? VideoCallVC else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onBtnSend(_ sender: Any) {
    }
    
    
    func calculateTextHeight(text: String, font: UIFont, maxWidth: CGFloat) -> CGFloat {
        let maxSize = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        let textAttributes: [NSAttributedString.Key: Any] = [.font: font]
        
        let boundingRect = text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: textAttributes, context: nil)
        
        return ceil(boundingRect.height)
    }
}
extension ConversationVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = messageData[indexPath.row]
        if data.isDoctor {
            let cell = tableView.dequeueReusableCell(withIdentifier: doctorMessageCell, for: indexPath) as? DoctorMessageCell
            cell?.setMessageData(data: data )
            return cell ?? UITableViewCell()
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: sendMessageCelldentifier, for: indexPath) as? SendMessageCell
            cell?.setMessageData(data: data )
            cell?.vuMessage.roundCorners(corners: [.topLeft, .bottomLeft, .bottomRight], amount: 12.0)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = messageData[indexPath.row]
        let font = UIFont.systemFont(ofSize: 17)
        let maxWidth = tableView.bounds.width
        let textHeight: CGFloat
        if data.isDoctor {
            textHeight = calculateTextHeight(text: data.message, font: font, maxWidth: maxWidth )
        } else {
            textHeight = calculateTextHeight(text: data.message, font: font, maxWidth: maxWidth / 1.6)
        }
        if data.isDoctor {
            return textHeight + 150
        }else {
            return  textHeight + 70
        }
    }
    
}
