//
//  FriendsTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 12.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
        
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var friendsIndex: [String] = []
    
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Друзья"
        mySearchBar.delegate = self
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        indexCreate()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText.lowercased()
        tableView.reloadData()
    }
    
    func indexCreate() {
        var tempIndex: [String] = []
        for item in FriendsDatasource.instance.friends {
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
        let items = filterFriends(section)
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        let items = filterFriends(indexPath.section)
        cell.setup(item: items[indexPath.row])
        return cell
//        cell.avatarImageView.image = UIImage(named: friends[indexPath.row].avatar)
//        cell.titleLabel.text = friends[indexPath.row].name
        // старый вариант
    }
    
    func filterFriends(_ section: Int) -> [Friends] {
        return FriendsDatasource.instance.friends.filter { (friend) -> Bool in
            (searchText.isEmpty || String(friend.title.lowercased()).contains(searchText))
            && friendsIndex[section] == String(friend.title.first!) }
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsIndex
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoGalleryViewController") as! PhotoGalleryViewController
        let items = FriendsDatasource.instance.friends.filter { (friend) -> Bool in friendsIndex[indexPath.section] == String(friend.title.first!)}
        vc.friend = items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

