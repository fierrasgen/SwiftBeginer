//
//  UniversalTableViewCell.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarView: CustomAvatar!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup(item: UniversalModel) {
        avatarView.imageView.image = UIImage(named: item.avatar.first!)
        titleLabel.text = item.title
    
    }

}
