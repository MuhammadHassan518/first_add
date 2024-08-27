//
//  ChatsCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 23/07/2024.
//

import UIKit

class ChatsCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setMessageData(data: MessagesModel) {
        self.img.layer.cornerRadius = 32.5
        self.img.image = UIImage(named: data.image)
        self.imgStatus.image = data.status ? UIImage(named: "greenEllipse") : UIImage(named: "doubleCheck")
        self.lblMessage.text = data.message
        self.lblName.text = data.name
        self.lblTime.text = data.time
    }
    
}
