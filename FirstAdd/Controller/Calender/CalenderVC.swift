//
//  CalenderVC.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit
import SwiftMessages

class CalenderVC: UIViewController {
    
    enum isSelectedButton {
        case upcoming
        case completed
        case cancel
    }
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnUpComing: UIButton!
    @IBOutlet weak var btnCompleted: UIButton!
    @IBOutlet weak var table: UITableView!
    
    let scheduleCells = CellIdentifiers.scheduleCells
    var scheduleData = [scheduleModel]()
    var selectedButton = isSelectedButton.upcoming
    var filteredScheduleData: [scheduleModel] {
        switch selectedButton {
        case .upcoming:
            return scheduleData.filter { $0.scheduleStatus == .upcoming }
        case .completed:
            return scheduleData.filter { $0.scheduleStatus == .completed }
        case .cancel:
            return scheduleData.filter { $0.scheduleStatus == .cancel }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        registerCell()
    }
    func setUI() {
        btnUpComing.layer.cornerRadius = 10
        btnCancel.layer.cornerRadius = 10
        btnCompleted.layer.cornerRadius = 10
    }
    
    func registerCell() {
        table.register(UINib(nibName: scheduleCells, bundle: nil), forCellReuseIdentifier: scheduleCells)
    }
    
    
    func setData() {
        scheduleData = [
            scheduleModel(image: "videoPerson2",
                          name: "Dr. John Smith",
                          time: "10:30 AM",
                          status: true,
                          date: "26/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.upcoming),
            
            scheduleModel(image: "schedules.Dr.Sara",
                          name: "Dr. Sara Devis",
                          time: "12:30 AM",
                          status: true,
                          date: "29/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.upcoming),
            
            scheduleModel(image: "Dr. David Anderson",
                          name: "Dr. David Anderson",
                          time: "10:30 AM",
                          status: true,
                          date: "26/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.completed),
            
            scheduleModel(image: "Dr. John Smith top",
                          name: "Dr. John Smith",
                          time: "10:30 AM",
                          status: true,
                          date: "26/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.completed),
            
            scheduleModel(image: "Dr. John Smith top",
                          name: "Dr. John Smith",
                          time: "10:30 AM",
                          status: true,
                          date: "26/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.cancel),
            
            scheduleModel(image: "Dr. David Anderson",
                          name: "Dr. David Anderson",
                          time: "10:30 AM",
                          status: true,
                          date: "26/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.cancel),
            
            scheduleModel(image: "schedules.Dr.Sara",
                          name: "Dr. Sara Devis",
                          time: "10:30 AM",
                          status: true,
                          date: "26/06/2023",
                          special: "Chardiologist",
                          scheduleStatus: schedule.cancel)
            
            ]
    }
    
    @IBAction func onBtnCompleted(_ sender: Any) {
        selectedButton = .completed
        table.reloadData()
        btnCompleted.backgroundColor = UIColor.systemBlue
        btnCompleted.tintColor = UIColor.white
        
        btnUpComing.backgroundColor = UIColor.white
        btnUpComing.tintColor = UIColor.black
        
        btnCancel.backgroundColor = UIColor.white
        btnCancel.tintColor = UIColor.black
        
    }
    
    @IBAction func onBtnUpComing(_ sender: Any) {
        selectedButton = .upcoming
        table.reloadData()
        btnUpComing.backgroundColor = UIColor.systemBlue
        btnUpComing.tintColor = UIColor.white
        
        btnCompleted.backgroundColor = UIColor.white
        btnCompleted.tintColor = UIColor.black
        
        btnCancel.backgroundColor = UIColor.white
        btnCancel.tintColor = UIColor.black
    }
    
    @IBAction func onBtnCancel(_ sender: Any) {
        selectedButton = .cancel
        table.reloadData()
        btnCancel.backgroundColor = UIColor.systemBlue
        btnCancel.tintColor = UIColor.white
        
        btnCompleted.backgroundColor = UIColor.white
        btnCompleted.tintColor = UIColor.black
        
        btnUpComing.backgroundColor = UIColor.white
        btnUpComing.tintColor = UIColor.black
    }
    
    
    
}


extension CalenderVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredScheduleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: scheduleCells, for: indexPath) as? ScheduleCells
        let data = filteredScheduleData[indexPath.row]
        cell?.setScheduleData(data: data)
        cell?.btnCancel.addTarget(self, action: #selector(onBtnCancelSchecule(_:)), for: .touchUpInside)
        cell?.btnReschedule.addTarget(self, action: #selector(onBtnReSchecule(_:)), for: .touchUpInside)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedButton == .cancel || selectedButton == .completed {
            120
        }else {
            200
        }
    }
    
    
    @objc func onBtnCancelSchecule(_ sender: UIButton) {
        showSuccessAlert(title: "Cancel Appointmints", message: "Are you sure to cancel Appintments you will not be able to re-schedule it for one week", btnTitle: "Ok")
    }
    
    @objc func onBtnReSchecule(_ sender: UIButton) {
        showSuccessAlert(title: "Reschedule Appointmints", message: "Are you sure to Reschedule Appintments you will not be able to re-schedule it for one week", btnTitle: "Ok")
    }
}

extension CalenderVC {
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

