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
    
    
    func configure(model: NewsModel) {
        mainImageView.image = model.images.first
        authorLabel.text = model.author
        dateLabel.text = model.postDate
        newsTextLabel.text = model.text
    }
}
