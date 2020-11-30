//
//  SocialService.swift
//  Social App
//
//  Created by Alexander Novikov on 25.11.2020.
//

import Foundation
import Alamofire


class UserResponse: Decodable {
    let items: [User]
}
class PhotoResponse: Decodable {
    let items: [Photo]
}
class GrouopResponse: Decodable {
    let items: [Group]
}

class SocialService {

    
    static func friendsAF(){
       
    AF.request("https://api.vk.com/method/friends.get?user_id=6405013&order=name&count=5&fields=city&access_token=\(UserSession.instance.token)&v=5.126").responseJSON {
            response in
            print(response.value)
        }
    }
    
    static func photoAF(){
    AF.request("https://api.vk.com/method/photos.get?owner_id=6405013&album_id=wall&count=3&access_token=\(UserSession.instance.token)&v=5.126").responseJSON {
            response in
            print(response.value)
        }
    }
    
    static func groupAF(){
    AF.request("https://api.vk.com/method/groups.get?user_ids=6405013&extended=1&count=3&access_token=\(UserSession.instance.token)&v=5.126").responseJSON {
            response in
            print(response.value)
        }
    }


    let baseUrl = "https://api.vk.com/method"
    let apiKey = "\(UserSession.instance.token)"
    
    func loadGroupsData(Music: String){
    
        let path = "/groups.search&q=3&offset=3&count=3"

        let parameters: Parameters = [
            "q": Music,
            "appid": apiKey
        ]
    
        let url = baseUrl+path
        
    // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value)
        }
        
    }
}
