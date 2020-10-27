//
//  PhotoGalleryViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 20.10.2020.
//

import UIKit

private let reuseIdentifier = "friendCollectionCell"

class PhotoGalleryViewController: UICollectionViewController {

  
    @IBAction func clickedLike(_ sender: UIButton) {
    }
    
    var friend: UniversalModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let friend = friend else {return}
        navigationItem.title = friend.title
        
    }

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let friend = friend else { return 0 }
        return friend.avatar.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoGalleryCell
        
        cell.avatarImageView.image = UIImage(named: friend!.avatar[indexPath.item])

        return cell
    }

   

    
    
}
