//
//  CartCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 29/07/2024.
//

import UIKit

class CartCell: UICollectionViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnAddQuantity: UIButton!
    @IBOutlet weak var btnReduceQuantity: UIButton!
    @IBOutlet weak var lblProPrice: UILabel!
    @IBOutlet weak var lblProName: UILabel!
    @IBOutlet weak var lblProQuantity: UILabel!
    @IBOutlet weak var lblProCounts: UILabel!
    @IBOutlet weak var vuBack: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set the border color using the hex color #E8F3F1
        let r: CGFloat = 232 / 255.0
        let g: CGFloat = 243 / 255.0
        let b: CGFloat = 241 / 255.0
        let a: CGFloat = 1.0
        
        vuBack.layer.borderColor = CGColor(red: r, green: g, blue: b, alpha: a)
        vuBack.layer.borderWidth = 2.0
        vuBack.layer.cornerRadius = 10
    }

    func setData(data: MedicionsModel) {
        self.lblProName.text = data.name
        self.lblProPrice.text = "$" + data.price
        self.lblProQuantity.text = data.tablets
        self.imgProduct.image = UIImage(named: data.image)

    }
}
