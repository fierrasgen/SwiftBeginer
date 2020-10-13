//
//  GroupTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 12.10.2020.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
//    let group: [UniversalModel] = [Groups(avatar: "21", title: "Книги"), Groups(avatar: "22", title: "Фильмы"), Groups(avatar: "23", title: "Игры"), Groups(avatar: "24", title: "Музыка")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Группы"
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = GroupDataBase.instance.item.filter { (i) -> Bool in return i.added == true
        }
        return item.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        let item = GroupDataBase.instance.item.filter { (i) -> Bool in return i.added == true
        }
        cell.setup(item: item[indexPath.row])
        return cell
        
        
//        cell.avatarImageView.image = UIImage(named: friends[indexPath.row].avatar)
//        cell.titleLabel.text = friends[indexPath.row].name
        // старый вариант
    }
}
