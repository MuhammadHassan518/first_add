//
//  ScheduleCells.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 25/07/2024.
//

import UIKit

class ScheduleCells: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblStaus: UILabel!
    @IBOutlet weak var lblTName: UILabel!
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnReschedule: UIButton!
    @IBOutlet weak var vuStack: UIStackView!
    @IBOutlet weak var vuBack: UIView!
    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var imgStatus: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let r: CGFloat = 232 / 255.0
        let g: CGFloat = 243 / 255.0
        let b: CGFloat = 241 / 255.0
        let a: CGFloat = 1.0
        self.vuBack.layer.cornerRadius = 10
        self.vuBack.layer.borderColor = CGColor(red: r, green: g, blue: b, alpha: a)
        self.vuBack.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setScheduleData(data: scheduleModel) {
        self.imgDoctor.layer.cornerRadius = 25
        self.btnCancel.layer.cornerRadius = 10
        self.btnReschedule.layer.cornerRadius = 10
        self.imgDoctor.image = UIImage(named: data.image)
        self.imgStatus.image =  data.status ? UIImage(named: "greenEllipse") : UIImage(named: "blueEllipse")
        self.lblSpecial.text = data.specil
        self.lblTName.text = data.name
        self.lblTime.text = data.time
        self.lblDate.text = data.date
        
        if data.scheduleStatus == .cancel || data.scheduleStatus == .completed {
            btnCancel.isHidden = true
            btnReschedule.isHidden = true
            self.imgStatus.image =  UIImage(named: "blueEllipse")
            self.lblStaus.text =  data.scheduleStatus == .cancel ? "Canceled" : "Completed"
        } else {
            self.imgStatus.image = UIImage(named: "greenEllipse")
            btnCancel.isHidden = false
            btnReschedule.isHidden = false
            self.lblStaus.text =  "Confirmed"
        }
        
    }
    
}
