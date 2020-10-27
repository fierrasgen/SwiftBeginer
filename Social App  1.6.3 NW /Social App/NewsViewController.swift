//
//  NewsViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 21.10.2020.
//

import UIKit

private let reuseIdentifier = "NewsCell"

class NewsViewController: UICollectionViewController {

    
    var news: UniversalModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let friend = news else {return}
        navigationItem.title = friend.title
        
    }

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let friend = news else { return 0 }
        return friend.avatar.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoGalleryCell
        
        cell.avatarImageView.image = UIImage(named: news!.avatar[indexPath.item])

        return cell
    }

   

}
