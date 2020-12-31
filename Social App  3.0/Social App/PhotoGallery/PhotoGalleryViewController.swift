//
//  PhotoGalleryViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 20.10.2020.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "friendCollectionCell"

class PhotoGalleryViewController: UICollectionViewController {

    var friend: UniversalModel?
    var photoPars: [Photo] = []
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let friend = friend else {return}
        navigationItem.title = friend.title
        
        //парсинг вызов
        SocialService.photoAF() { [weak self] photoPars in
//            self?.photoPars = photoPars
            self?.loadData()
            self?.collectionView.reloadData()
        }
    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friend = friend else { return 0 }
//        return friend.avatar.count
        return photoPars.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoGalleryCell
        
        let photoInfo = photoPars[indexPath.row]
        
        
        cell.likeButtonView.delegate = self
        cell.likeButtonView.index = indexPath.item
        cell.avatarImageView.image = UIImage(named: friend!.avatar[indexPath.item])
        cell.likeButtonView.likes = friend!.likes[indexPath.item]
        cell.likeButtonView.likedByMe = friend!.likedByMe[indexPath.item]
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Cell clicked")
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoGalleryCell
//        friend!.likes[indexPath.item] = cell.likeButtonView.likes
//        friend!.likedByMe[indexPath.item] = cell.likeButtonView.likedByMe
//    }

}

 extension PhotoGalleryViewController: LikeButtonDelegate {
    func likesChanged(index: Int, likes: UInt, likedByMe: Bool) {
        friend?.likes[index] = likes
        friend?.likedByMe[index] = likedByMe
        FriendsDatasource.instance.change(friend as! Friends)
     }
    
    func loadData() {
            do {
                let realm = try Realm()
                let photos = realm.objects(Photo.self)
                self.photoPars = Array(photos)
            } catch {
                print(error)
            }
        }
 }
