//
//  Parser.swift
//  Social App
//
//  Created by Alexander Novikov on 30.11.2020.
//

import Foundation
import UIKit
import Alamofire
import RealmSwift
import FirebaseFirestore

class User: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    
    enum UserKeys: String, CodingKey {
            case id
            case fitstname = "first_name"
            case lastname = "last_name"
        }
    
    override init() {
            super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: UserKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        let user  = try decoder.container(keyedBy: UserKeys.self)
        self.firstname = try user.decode(String.self, forKey: .fitstname)
        let userName = try decoder.container(keyedBy: UserKeys.self)
        self.lastname = try userName.decode(String.self, forKey: .lastname)
        }
    
    func toFirestore() -> [String: Any] {
        return [
            String(format: "name", id) : firstname
        ]
    }
}






class Photo: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    @objc dynamic var type: String = ""
    
    enum PhotoKeys: String, CodingKey {
        case id
        case height
        case width
        case type
    }
    
    override init() {
            super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let photoId = try decoder.container(keyedBy: PhotoKeys.self)
        self.id = try photoId.decode(Int.self, forKey: .id)
        let photoHeight  = try decoder.container(keyedBy: PhotoKeys.self)
        self.height = try photoHeight.decode(Int.self, forKey: .height)
        let photoWidth  = try decoder.container(keyedBy: PhotoKeys.self)
        self.width = try photoWidth.decode(Int.self, forKey: .width)
        let photoType  = try decoder.container(keyedBy: PhotoKeys.self)
        self.type = try photoType.decode(String.self, forKey: .type)
    }
}
    


class Group: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    
    enum GroupKeys: String, CodingKey {
        case id
        case name
        case type
    }
    
    override init() {
            super.init()
    }
    
    required init(from decoder: Decoder) throws {
       
        let groupId = try decoder.container(keyedBy: GroupKeys.self)
        self.id = try groupId.decode(Int.self, forKey: .id)
        let groupUser  = try decoder.container(keyedBy: GroupKeys.self)
        self.name = try groupUser.decode(String.self, forKey: .name)
        let groupType  = try decoder.container(keyedBy: GroupKeys.self)
        self.type = try groupType.decode(String.self, forKey: .type)
    }
}



class Post: Object, Decodable {
    @objc dynamic var post: String = ""
    @objc dynamic var note: String = ""

    
    
    enum NewsKeys: String, CodingKey {
        case post
        case note
       
    }
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let postType  = try decoder.container(keyedBy: NewsKeys.self)
        self.post = try postType.decode(String.self, forKey: .post)
        let newsType  = try decoder.container(keyedBy: NewsKeys.self)
        self.note = try newsType.decode(String.self, forKey: .note)
    }
}

    
   


