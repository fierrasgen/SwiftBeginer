//
//  NewsModel.swift
//  Social App
//
//  Created by Alexander Novikov on 26.10.2020.
//

import UIKit

struct NewsModel {
    var author: String
    var postDate: String
    var text: String
    var images: [UIImage]
    
//    static let fake: [NewsModel] = (1...5).map { _ in
//        NewsModel(
//            author: Lorem.fullName,
//            postDate: "26.10.2020",
//            text: Lorem.sentences(Int.random(in: 2...5)),
//            images: (1...Int.random(in: 5...10))
//                .map { $0 % 5 }
//                .shuffled()
//                .compactMap( {String($0) })
//                .compactMap({ UIImage(named: $0) })
//        )
//    }
}
