//
//  FriendsTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 12.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    let friends: [UniversalModel] =
        [Friends(avatar: ["11", "11", "11", "11"], title: "Кузьма"),
         Friends(avatar: ["12", "12", "12", "12"], title: "Васька"),
         Friends(avatar: ["13", "13", "13", "13"], title: "Прошка"),
         Friends(avatar: ["14", "14", "14", "14"], title: "Трусишка")]

//    var filteredFriends = [String]!
    
    @IBOutlet weak var searchFriends: UISearchBar!
    
    var friendsIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Друзья"
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        indexCreate()
        
        searchFriends.delegate = self
//        filteredFriends = friends
    }

    func indexCreate() {
        var tempIndex: [String] = []
        for item in friends {
            tempIndex.append(String(item.title.first!))
        }
        
        friendsIndex = Array(Set(tempIndex)).sorted()
    }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsIndex.count
    }
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return String(friendsIndex[section])
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = friends.filter { (friend) -> Bool in friendsIndex[section] == String(friend.title.first!)
        }
        
        return items.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        let items = friends.filter { (friend) -> Bool in friendsIndex[indexPath.section] == String(friend.title.first!)
        }
            cell.setup(item: items[indexPath.row])
     
        return cell
//        cell.avatarImageView.image = UIImage(named: friends[indexPath.row].avatar)
//        cell.titleLabel.text = friends[indexPath.row].name
        // старый вариант
        
    
        
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsIndex
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoGalleryViewController") as! PhotoGalleryViewController
        let items = friends.filter { (friend) -> Bool in friendsIndex[indexPath.section] == String(friend.title.first!)}
        vc.friend = items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // Mark: Search bar config
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredFriends = []
//    }
//}
}
