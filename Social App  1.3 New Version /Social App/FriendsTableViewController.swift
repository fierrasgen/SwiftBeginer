//
//  FriendsTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 12.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friends: [UniversalModel] = [Friends(avatar: "11", title: "Кузьма"), Friends(avatar: "12", title: "Васька"), Friends(avatar: "13", title: "Панфилий"), Friends(avatar: "14", title: "Трусишка")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Друзья"
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
    }

  

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        cell.setup(item: friends[indexPath.row])
        
        
//        cell.avatarImageView.image = UIImage(named: friends[indexPath.row].avatar)
//        cell.titleLabel.text = friends[indexPath.row].name
        // старый вариант
        
    
        return cell
    }



}
