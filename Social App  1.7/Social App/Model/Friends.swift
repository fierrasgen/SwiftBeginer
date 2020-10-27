//
//  Friends.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import Foundation


protocol UniversalModel {
    var avatar: [String] { get set }
    var likes: [UInt] {get set}
    var likedByMe: [Bool] {get set}
    var title: String { get set }
}

struct Friends: UniversalModel {
    var avatar: [String]
    var likes: [UInt]
    var likedByMe: [Bool]
    var title: String
}

class FriendsDatasource {
    static let instance = FriendsDatasource()
    
    private init() {
    }

    var friends: [Friends] =
        [Friends(avatar: ["11", "11", "11", "11"], likes: [4, 5, 2, 1], likedByMe: [true, false, false, false], title: "Кузьма"),
         Friends(avatar: ["12", "12", "12", "12"], likes: [1, 3, 2, 0], likedByMe: [false, false, false, false], title: "Васька"),
         Friends(avatar: ["13", "13", "13", "13"], likes: [1, 2, 3, 4], likedByMe: [true, false, true, false], title: "Прошка"),
         Friends(avatar: ["14", "14", "14", "14"], likes: [0, 0, 0, 0], likedByMe: [false, false, false, false], title: "Трусишка")]
    
    func change(_ f: Friends) {
        for i in 0..<friends.count {
            if friends[i].title == f.title {
               friends[i] = f
            }
        }
    }
}
