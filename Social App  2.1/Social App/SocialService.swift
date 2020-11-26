//
//  SocialService.swift
//  Social App
//
//  Created by Alexander Novikov on 25.11.2020.
//

import Foundation
import Alamofire




class SocialService {

    
    static func friendsAF(){
    AF.request("https://api.vk.com/method/friends.get?user_id=6405013&order=name&count=5&fields=city&access_token=a935d66af8df74726cdbe500bdc106b6333423537066c30e3bc0f73ad247a4889b11148c12daea055fb00&v=5.126").responseJSON {
            response in
            print(response.value)
        }
    }
    
    static func photoAF(){
    AF.request("https://api.vk.com/method/photos.get?owner_id=6405013&album_id=wall&count=5&access_token=a935d66af8df74726cdbe500bdc106b6333423537066c30e3bc0f73ad247a4889b11148c12daea055fb00&v=5.126").responseJSON {
            response in
            print(response.value)
        }
    }
    
    static func groupAF(){
    AF.request("https://api.vk.com/method/groups.get?user_ids=6405013&extended=1&count=5&access_token=a935d66af8df74726cdbe500bdc106b6333423537066c30e3bc0f73ad247a4889b11148c12daea055fb00&v=5.126").responseJSON {
            response in
            print(response.value)
        }
    }


    let baseUrl = "https://api.vk.com/method"
    let apiKey = "a935d66af8df74726cdbe500bdc106b6333423537066c30e3bc0f73ad247a4889b11148c12daea055fb00"
    
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
