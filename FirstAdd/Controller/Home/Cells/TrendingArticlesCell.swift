//
//  TrendingArticlesCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 26/07/2024.
//

import UIKit

class TrendingArticlesCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesrp: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblReadTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData(data: HealthModel){
        self.img.image           = UIImage(named: data.image)
        self.lblTitle.text       = data.title
        self.lblReadTime.text    = data.redTim
        self.lblDate.text        = data.date
        self.lblDesrp.text       = data.discri
    }
}
