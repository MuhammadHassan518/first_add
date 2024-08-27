//
//  SendMessageCell.swift
//  FirstAdd
//
//  Created by INVISION - 240 on 23/07/2024.
//

import UIKit

class SendMessageCell: UITableViewCell {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var imgMessageDelivr: UIImageView!
    @IBOutlet weak var vuMessage: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

    func setMessageData(data: MessagesModel) {
        
        self.lblMessage.text = data.message
        self.imgMessageDelivr.image = data.status ? UIImage(named: "doubleCheckWhite") : UIImage(named: "doubleCheck")
    }
    
}
