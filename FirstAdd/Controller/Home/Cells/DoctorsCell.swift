//
//  DoctorsCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class DoctorsCell: UICollectionViewCell {
    @IBOutlet weak var vuBack: UIView!
    @IBOutlet weak var vuReview: UIView!
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
        img.layer.cornerRadius = 35
        vuBack.layer.cornerRadius = 10
        vuBack.layer.borderWidth = 1
        let red: CGFloat = 232 / 255.0
        let green: CGFloat = 243 / 255.0
        let blue: CGFloat = 241 / 255.0
        let alpha: CGFloat = 1.0
        vuBack.layer.borderColor = CGColor(red: red, green: green, blue: blue, alpha: alpha)
        vuBack.layer.borderWidth = 1.0
    }

    
    func setDoctorsData(data: DoctorModel) {
        self.img.image = UIImage(named: data.image)
        self.lblDistance.text = data.distance
        self.lblName.text = data.name
        self.lblSpecilist.text = data.specilist
    }
    
}
