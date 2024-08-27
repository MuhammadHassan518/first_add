//
//  HealthArticleCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 18/07/2024.
//

import UIKit

class HealthArticleCell: UITableViewCell {

    @IBOutlet weak var vuBackground: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblReadingTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let r: CGFloat = 232 / 255.0
        let g: CGFloat = 243 / 255.0
        let b: CGFloat = 241 / 255.0
        let a: CGFloat = 1.0
        self.vuBackground.layer.cornerRadius = 10
        self.vuBackground.layer.borderColor = CGColor(red: r, green: g, blue: b, alpha: a)
        self.vuBackground.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func setData(data: HealthModel){
        self.img.image           = UIImage(named: data.image)
        self.lblTitle.text       = data.title
        self.lblReadingTime.text = ".    " + data.redTim
        self.lblDate.text        = data.date
        
    }
}
