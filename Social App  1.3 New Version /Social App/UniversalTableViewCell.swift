//
//  UniversalTableViewCell.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup(item: UniversalModel) {
        avatarImageView.image = UIImage(named: item.avatar)
        titleLabel.text = item.title
    
    }

}
