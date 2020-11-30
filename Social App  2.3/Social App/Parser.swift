//
//  Parser.swift
//  Social App
//
//  Created by Alexander Novikov on 30.11.2020.
//

import Foundation
import UIKit
import Alamofire

class User: Decodable {
    var id: Int = 0
    var firstname: String = ""
    var lastname: String = ""
    
    enum UserKeys: String, CodingKey {
            case id
            case fitstname = "first_name"
            case lastname = "last_name"
        }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: UserKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        let user  = try decoder.container(keyedBy: UserKeys.self)
        self.firstname = try user.decode(String.self, forKey: .fitstname)
        let userName = try decoder.container(keyedBy: UserKeys.self)
        self.lastname = try userName.decode(String.self, forKey: .lastname)
        
       
    }
}

class Photo: Decodable {
    var id: Int = 0
    var height: Int = 0
    var width: Int = 0
    var type: String = ""
    
    enum PhotoKeys: String, CodingKey {
        case id
        case height
        case width
        case type
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
    


class Group: Decodable {
    var id: Int = 0
    var name: String = ""
    var type: String = ""
    
    enum GroupKeys: String, CodingKey {
        case id
        case name
        case type
    }
    
    
    required init(from decoder: Decoder) throws {
       
        let value = try decoder.container(keyedBy: GroupKeys.self)
        self.id = try value.decode(Int.self, forKey: .id)
        let groupUser  = try decoder.container(keyedBy: GroupKeys.self)
        self.name = try groupUser.decode(String.self, forKey: .name)
        let groupType  = try decoder.container(keyedBy: GroupKeys.self)
        self.type = try groupType.decode(String.self, forKey: .type)
    }
}



    
    
    
   


