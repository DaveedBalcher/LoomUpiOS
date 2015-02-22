//
//  MessageCell.swift
//  PCF App
//
//  Created by David Balcher on 2/22/15.
//  Copyright (c) 2015 David Balcher. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(messagePosted: String, postTime: String) {
        self.messageLabel.text = messagePosted
        self.postTimeLabel.text = postTime
    }

}
