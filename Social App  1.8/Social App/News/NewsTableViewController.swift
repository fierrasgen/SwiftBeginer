//
//  NewsTableViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 26.10.2020.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let news = NewsModel.fake

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

  


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        cell.configure(model: news[indexPath.row])
        return cell
    }
}
