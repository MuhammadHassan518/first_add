//
//  MessageVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class MessageVC: UIViewController {

    @IBOutlet weak var btnPrivate: UIButton!
    @IBOutlet weak var btnGroup: UIButton!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var btnNewChat: UIButton!
    
    let chatCellIdentifier = CellIdentifiers.chatsCell
    var messageData = [MessagesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCell()
    }
    
    func setUI() {
        btnAll.layer.cornerRadius = 10
        btnGroup.layer.cornerRadius = 10
        btnPrivate.layer.cornerRadius = 10
    }
    
    func registerCell() {
        table.register(UINib(nibName: chatCellIdentifier, bundle: nil), forCellReuseIdentifier: chatCellIdentifier)
    }
    
    func setData() {
        messageData = [
        MessagesModel(image: "Dr. John Smith top", 
                      name: "Dr. John Smith",
                      time: "10:30", 
                      status: true,
                      message: "I don’t have any fever,but headchace....",
                      isDoctor: true),
        
        MessagesModel(image: "Dr. Sarah Davis top", 
                      name: "Dr. Sarah Davis",
                      time: "11:00",
                      status: false,
                      message: "Hello,How can i help you",
                      isDoctor: true),
        
        MessagesModel(image: "Dr. Laura Martinez top",
                      name: "Dr. Laura Martinez",
                      time: "11:30",
                      status: false,
                      message: "Do you have fever?",
                      isDoctor: true)
        ]
    }
    
    
    @IBAction func onBtnSearch(_ sender: Any) {
    }
    
    @IBAction func onBtnGroup(_ sender: Any) {
        
        btnGroup.backgroundColor = UIColor.systemBlue
        btnGroup.tintColor = UIColor.white
        
        btnAll.backgroundColor = UIColor.white
        btnAll.tintColor = UIColor.black
        
        btnPrivate.backgroundColor = UIColor.white
        btnPrivate.tintColor = UIColor.black
        
    }
    
    @IBAction func onBtnAll(_ sender: Any) {
        btnAll.backgroundColor = UIColor.systemBlue
        btnAll.tintColor = UIColor.white
        
        btnGroup.backgroundColor = UIColor.white
        btnGroup.tintColor = UIColor.black
        
        btnPrivate.backgroundColor = UIColor.white
        btnPrivate.tintColor = UIColor.black
    }
    
    @IBAction func onBtnPrivate(_ sender: Any) {
        btnPrivate.backgroundColor = UIColor.systemBlue
        btnPrivate.tintColor = UIColor.white
        
        btnGroup.backgroundColor = UIColor.white
        btnGroup.tintColor = UIColor.black
        
        btnAll.backgroundColor = UIColor.white
        btnAll.tintColor = UIColor.black
    }
    
    @IBAction func onBtnStartChat(_ sender: Any) {
    }
}


extension MessageVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellIdentifier, for: indexPath) as? ChatsCell
        cell?.setMessageData(data: messageData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ConversationVC") as? ConversationVC else {return}
        vc.imgDoctor = messageData[indexPath.row].image
        vc.doctorName = messageData[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
