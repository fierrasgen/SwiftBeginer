//
//  FriendsTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 12.10.2020.
//

import UIKit
import RealmSwift
import FirebaseDatabase
import FirebaseAuth
import Firebase

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
        
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    @IBAction func resfresh(_ sender: UIBarButtonItem) {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(backgroundView)
        backgroundView.frame = view.bounds
        
        let loadingView = LoadingView()
        backgroundView.addSubview(loadingView)
        loadingView.center = view.center
        loadingView.startAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            backgroundView.removeFromSuperview()
        }
    }
    
    var friendsIndex: [String] = []
    var searchText = ""
//    var friendsPars: [User] = []
//    var token: NotificationToken?
    private var friendsPars = [FirebaseUser]()
    private let ref = Database.database().reference(withPath: "friendsPars")
    var friends: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Друзья"
        mySearchBar.delegate = self
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        indexCreate()
        // Парсинг
//        SocialService.friendsAF() {[weak self] friendsPars in
//            print("!!!\(friendsPars)")

//            self?.loadData()
//            self?.tableView.reloadData()
//            //Realm Notification
//            self?.readData()
       
        
            SocialService.friendsAF(for: "friends")
            .done(on: .main) { [weak self] friendsPars in
                            print("!!!\(friendsPars)")

//                            self?.loadData()
//                            self?.tableView.reloadData()
                            //Realm Notification
//                            self?.readData()

            }
        
            
            //1
            ref.observe(.value, with: { snapshot in
                var users: [FirebaseUser] = []
                    // 2
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                    let user = FirebaseUser(snapshot: snapshot) {
                    users.append(user)
                        }
                    }
                    // 3
                    self.friendsPars = users
                    self.tableView.reloadData()
                })
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
        return friendsPars.count
    }
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(friendsIndex[section])
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let items = filterFriends(section)
          return friendsPars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell") as! UniversalTableViewCell
        let userInfo = friendsPars[indexPath.row]
//        cell.setup(item: userInfo)
        
        let user = friendsPars[indexPath.row]
        cell.titleLabel.text = user.name

        let items = filterFriends(indexPath.section)
        cell.setup(item: items[indexPath.row])
        return cell

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
//        vc.friend = items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func loadData() {
//            do {
//                let realm = try Realm()
//                let users = realm.objects(User.self)
//                self.friendsPars = Array(users)
//            } catch {
//                print(error)
//            }
        }
    //Realm Notification
//    func readData() {
//        let realm = try! Realm()
//        let users = realm.objects(User.self)
//        token = users.observe { changes in
//            switch changes {
//                case .initial(let results):
//                    print("results")
//                case .update(let results, let deletions, let insertions, let modifications):
//                    print("results, deletions, insertions, modifications")
//                case .error(let error):
//                    print("Error occured: \(error.localizedDescription)")
//            }
//        }
//        print(Array(users))
//    }
    


