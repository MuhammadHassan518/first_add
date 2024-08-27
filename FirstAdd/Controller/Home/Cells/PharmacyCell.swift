//
//  PharmacyCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 26/07/2024.
//

import UIKit

class PharmacyCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTablets: UILabel!
    @IBOutlet weak var vuBackground: UIView!
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var lbldicscountPrice: UILabel!

    let r: CGFloat = 232 / 255.0
    let g: CGFloat = 243 / 255.0
    let b: CGFloat = 241 / 255.0
    let a: CGFloat = 1.0
    override func awakeFromNib() {
        super.awakeFromNib()
        let color = CGColor(red: r, green: g, blue: b, alpha: a)
        vuBackground.layer.borderColor = color
        vuBackground.layer.borderWidth = 2.0
        vuBackground.layer.cornerRadius = 10
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Your Text")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
    }

    func setData(data: MedicionsModel) {
        self.lblName.text = data.name
        self.lblPrice.text = "$" + data.price
        self.lblTablets.text = data.tablets
        self.img.image = UIImage(named: data.image)
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$15.98")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        lbldicscountPrice.attributedText = attributeString

    }
    
}
