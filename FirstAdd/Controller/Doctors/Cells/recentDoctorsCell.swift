//
//  recentDoctorsCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 19/07/2024.
//

import UIKit

class recentDoctorsCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func setDoctorsData(data: DoctorModel) {
        self.img.image = UIImage(named: data.image)
        self.lblName.text = data.name
    }
    
}
