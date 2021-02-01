//
//  GroupTableViewCell.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!{
        didSet{
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addSubview(avatarImageView)
        addSubview(titleLabel)
    }
    
    let instets: CGFloat = 10.0
    
    
    func setTitle(text: String) {
        titleLabel.text = text
        titleLabelFrame()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabelFrame()
        avatarFrame()
    }
    
    func getLabelSize(text: String, font: UIFont) -> CGSize {
     
        let maxWidth = bounds.width - instets * 2
        let textBlock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        let rect = text.boundingRect(with: textBlock, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let width = Double(rect.size.width)
        let height = Double(rect.size.height)
        let size = CGSize(width: ceil(width), height: ceil(height))
        return size
    }
    
    
    func titleLabelFrame() {
        
        let titleLabelSize = getLabelSize(text: titleLabel.text!, font: titleLabel.font)
        let titleLabelX = (bounds.width - titleLabelSize.width) / 2
        let titleLabelY = bounds.height - titleLabelSize.height - instets
        let titleLabelOrigin =  CGPoint(x: titleLabelX, y: titleLabelY)
        titleLabel.frame = CGRect(origin: titleLabelOrigin, size: titleLabelSize)
    }
    
    func avatarFrame() {
        let avatarSideLinght: CGFloat = 50
        let avatarSize = CGSize(width: avatarSideLinght, height: avatarSideLinght)
        let avatarOrigin = CGPoint(x: bounds.midX - avatarSideLinght / 2, y: bounds.midY - avatarSideLinght / 2)
        avatarImageView.frame = CGRect(origin: avatarOrigin, size: avatarSize)
    }
}

    
    
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


