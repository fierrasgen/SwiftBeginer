//
//  NewsTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 26.10.2020.
//

import UIKit
import RealmSwift

class NewsTableViewController: UITableViewController {
    
//    let news = NewsModel.fake
    var newsPars: [Post] = []
    var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        SocialService.newsAF() { [weak self] photoPars in
//            self?.photoPars = photoPars
            self?.loadData()
        }
    }

  


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
//        cell.configure(model: news[indexPath.row])
        return cell
    }
    
    func loadData() {
            do {
                let realm = try Realm()
                let news = realm.objects(Post.self)
                self.newsPars = Array(news)
            } catch {
                print(error)
            }
        }
 }

