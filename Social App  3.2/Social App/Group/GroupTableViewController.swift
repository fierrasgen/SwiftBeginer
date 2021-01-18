//
//  GroupTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 12.10.2020.
//

import UIKit
import RealmSwift
import Alamofire

class GroupTableViewController: UITableViewController {
    
//    let group: [UniversalModel] = [Groups(avatar: "21", title: "Книги"), Groups(avatar: "22", title: "Фильмы"), Groups(avatar: "23", title: "Игры"), Groups(avatar: "24", title: "Музыка")]
    
    var groupPars: [Group] = []
    var token: NotificationToken?
    private var operationQueue = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Группы"
        
        let getDataOperation = GetDataOperation()
        getDataOperation.completionBlock = { [weak self] in
            guard let data = getDataOperation.data else { return }
            let value = String(data: data, encoding: .utf8)
            print(value)
        }
        operationQueue.addOperation(getDataOperation)
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
        // парсинг вызов
//        SocialService.groupAF() {[weak self] groupPars in
////            self?.groupPars = groupPars
////            self?.loadData()
////            self?.tableView.reloadData()
//            //Realm Notification
//            self?.readData()
//        }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = GroupDataBase.instance.item.filter { (i) -> Bool in return i.added == true
        }
        return groupPars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        let item = GroupDataBase.instance.item.filter { (i) -> Bool in return i.added == true
        }
        let groupInfo = groupPars[indexPath.row]
        cell.setup(item: groupInfo)
//        cell.setup(item: item[indexPath.row])
        return cell
    }
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print(indexPath)
            GroupDataBase.instance.item.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            }

    }
    
    
    func loadData() {
            do {
                let realm = try Realm()
                let groups = realm.objects(Group.self)
                self.groupPars = Array(groups)
            } catch {
                print(error)
            }
        }
    
    //Realm Notification
    func readData() {
        let realm = try! Realm()
        let groups = realm.objects(Group.self)
        token = groups.observe { changes in
            switch changes {
                case .initial(let results):
                    print("results")
                case .update(let results, let deletions, let insertions, let modifications):
                    print("results, deletions, insertions, modifications")
                case .error(let error):
                    print("Error occured: \(error.localizedDescription)")
            }
        }
        print(Array(groups))
    }
    
}





