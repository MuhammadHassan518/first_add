//
//  PopuarArticlCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 26/07/2024.
//

import UIKit

class PopuarArticlCell: UICollectionViewCell {
    @IBOutlet weak var btnArticle: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        btnArticle.layer.cornerRadius = 10
    }

}
