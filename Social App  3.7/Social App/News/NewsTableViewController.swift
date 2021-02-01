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
    @objc var newsPars: [Post] = []
    var token: NotificationToken?
    var nextFrom = ""
    var isLoading = false
    var socialServise = SocialService()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.prefetchDataSource = self
        setupRefreshControl()
        
//        SocialService.newsRequest() { [weak self] photoPars,<#arg#>  in
////            self?.photoPars = photoPars
//            self?.loadData()
//            self?.setupRefreshControl()
        }
    

  


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
//        cell.configure(model: news[indexPath.row])
        let newsItem = self.newsPars[indexPath.row]
        cell.configure(title: newsItem.post)
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.row {
//
//        case 2:
//                let tableWidth = tableView.bounds.width
//                let news = self.newsPars[indexPath.section]
////                let cellHeight = tableWidth * news.aspectRatio
//                return cellHeight
//        default:
//                return UITableView.automaticDimension
//
//        }
//    }

    
    func loadData() {
            do {
                let realm = try Realm()
                let news = realm.objects(Post.self)
                self.newsPars = Array(news)
            } catch {
                print(error)
            }
        }
    
    
    fileprivate func setupRefreshControl() {
    
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl?.tintColor = .red
        refreshControl?.addTarget(self, action: #selector(getter: newsPars), for: .valueChanged)
    }
    
    @objc func refreshNews() {
        
        self.refreshControl?.beginRefreshing()

        let mostFreshNewsDate = self.newsPars.first?.date ?? Date().timeIntervalSince1970
        
        socialServise.newsRequest(startTime: mostFreshNewsDate + 1) { [weak self] news,Error  in
            guard let self = self else { return }
            self.refreshControl?.endRefreshing()
            guard self.newsPars.count > 0 else { return }
            self.newsPars = self.newsPars + self.newsPars
            let indexSet = IndexSet(integersIn: 0..<self.newsPars.count)
            self.tableView.insertSections(indexSet, with: .automatic)
        }
    }

}

extension NewsTableViewController: UITableViewDataSourcePrefetching {
       func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
         
           guard let maxSection = indexPaths.map({ $0.section }).max() else { return }
            if maxSection > newsPars.count - 3,
               !isLoading {
               isLoading = true
                socialServise.newsRequest(startFrom: nextFrom)
               { [weak self] (news, nextFrom) in
                   guard let self = self else { return }
                    let indexSet = IndexSet(integersIn: self.newsPars.count ..< self.newsPars.count + self.newsPars.count)
                    self.newsPars.append(contentsOf: self.newsPars)
                   self.tableView.insertSections(indexSet, with: .automatic)
                   self.isLoading = false
               }
           }
       }
    }

