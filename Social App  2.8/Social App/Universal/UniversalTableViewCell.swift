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
       
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarView.isUserInteractionEnabled = true
        avatarView.addGestureRecognizer(tap)
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup(item: UniversalModel) {
        avatarView.imageView.image = UIImage(named: item.avatar.first!)
        titleLabel.text = item.title
    }
    
    func setup(item: User) {
        titleLabel.text = item.firstname
        print("!!! \(item.firstname)")
    }
    
    func setup(item: Group){
        titleLabel.text = item.name
        print("!!! \(item.name)")
    }
    
//    func setup(item: Photo){
//        avatarView.imageView.image = UIImage(named: )
//    }
    
    @objc func avatarTapped(_ recognizer: UITapGestureRecognizer) {
        avatarView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.avatarView.transform = .identity
        }, completion: { _ in
            
        })
    }

}
