//
//  GroupCell.swift
//  Social App
//
//  Created by Alexander Novikov on 10.10.2020.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
