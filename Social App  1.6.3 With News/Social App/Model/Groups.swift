//
//  Groups.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import Foundation


struct Groups: UniversalModel {
    var avatar: [String]
    var likes: [UInt] = []
    var likedByMe: [Bool] = []
    var title: String
    var added: Bool
}


class GroupDataBase {
    
    static let instance = GroupDataBase()

    private init() {}
    
    var item: [Groups] = [
        Groups(avatar: ["21"], title: "Книги", added: false),
        Groups(avatar: ["22"], title: "Фильмы", added: false),
        Groups(avatar: ["23"], title: "Игры", added: false),
        Groups(avatar: ["24"], title: "Музыка", added: false)
    ]
    
    
    func change(group: Groups) {
        for i in 0..<item.count {
            if item[i].title == group.title {
               item[i] = group
            }
        }
    }
}
