//
//  NewsCell.swift
//  Social App
//
//  Created by Alexander Novikov on 26.10.2020.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func configure(title: String) {
        mainImageView.backgroundColor = .blue
        authorLabel.text = title
        dateLabel.text = title
        newsTextLabel.text = title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func configure(model: NewsModel) {
//        mainImageView.image = model.images.first
//        authorLabel.text = model.author
//        dateLabel.text = model.postDate
//        newsTextLabel.text = model.text
//    }
}
