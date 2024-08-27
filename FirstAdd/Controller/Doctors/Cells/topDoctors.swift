//
//  topDoctors.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class topDoctors: UITableViewCell {
    
    @IBOutlet weak var vuBack: UIView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblSpecilist: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        img.layer.cornerRadius = 10
        
        // Set the border color using the hex color #E8F3F1
        let r: CGFloat = 232 / 255.0
        let g: CGFloat = 243 / 255.0
        let b: CGFloat = 241 / 255.0
        let a: CGFloat = 1.0
        
        vuBack.layer.borderColor = CGColor(red: r, green: g, blue: b, alpha: a)
        vuBack.layer.borderWidth = 2.0
        vuBack.layer.cornerRadius = 10
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setDoctorsData(data: DoctorModel) {
        self.img.image = UIImage(named: data.image)
        self.lblDistance.text = data.distance
        self.lblName.text = data.name
        self.lblSpecilist.text = data.specilist
    }
}
