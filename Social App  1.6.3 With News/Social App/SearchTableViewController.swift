//
//  SearchTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var item = GroupDataBase.instance.item.filter { (i) -> Bool in return i.added == false}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Поиск"
        

        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  item.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        cell.setup(item: item[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item[indexPath.row].added = true
        GroupDataBase.instance.change(group: item[indexPath.row])
        
        
        self.navigationController?.popViewController(animated: true)
    }

}
