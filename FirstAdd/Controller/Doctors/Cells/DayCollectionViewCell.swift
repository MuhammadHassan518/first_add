//
//  DayCollectionViewCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 19/07/2024.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var vuBackground: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.vuBackground.backgroundColor = isSelected ? UIColor.systemBlue : UIColor.clear
            self.dayLabel.textColor = isSelected ? UIColor.white : UIColor.black
            self.dateLabel.textColor = isSelected ? UIColor.white : UIColor.black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vuBackground.layer.borderWidth = 3.0
        let r: CGFloat = 232 / 255.0
        let g: CGFloat = 243 / 255.0
        let b: CGFloat = 241 / 255.0
        let a: CGFloat = 1.0
        self.vuBackground.layer.borderColor = CGColor(red: r, green: g, blue: b, alpha: a)
        self.vuBackground.layer.cornerRadius = 10
    }
    
}
