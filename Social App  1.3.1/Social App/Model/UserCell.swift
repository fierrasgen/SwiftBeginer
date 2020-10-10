//
//  UserCell.swift
//  Social App
//
//  Created by Alexander Novikov on 09.10.2020.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
