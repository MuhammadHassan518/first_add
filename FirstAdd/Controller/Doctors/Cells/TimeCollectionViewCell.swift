//
//  TimeCollectionViewCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 19/07/2024.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var vuBackground: UIView!
    
    override var isSelected: Bool {
        didSet {
            self.vuBackground.backgroundColor = isSelected ? UIColor.systemBlue : UIColor.clear
            self.timeLabel.textColor = isSelected ? UIColor.white : UIColor.black
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
