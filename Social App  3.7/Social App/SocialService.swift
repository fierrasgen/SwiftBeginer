//
//  SocialService.swift
//  Social App
//
//  Created by Alexander Novikov on 25.11.2020.
//

import Foundation
import Alamofire
import RealmSwift
import Firebase
import FirebaseFirestore
import PromiseKit
import SwiftyJSON





class FriendsResponse: Decodable{
    let response: UserResponse
}

class PhotografyResponse: Decodable{
    let response: PhotoResponse
}
class GroupSocialResponse: Decodable{
    let response: GrouopResponse
}

class UserResponse: Decodable {
    let items: [User]
}
class PhotoResponse: Decodable {
    let items: [Photo]
}
class GrouopResponse: Decodable {
    let items: [Group]
}

class NewsResponse: Decodable{
    let items: [Post]
}

class SocialService {
    
    
    
    static func friendsAF(for friends: String) -> Promise<[User]>{
        let promise = Promise<[User]>{ resolver in
        AF.request("https://api.vk.com/method/friends.get?user_id=\(UserSession.instance.userId)&order=name&count=5&fields=city&access_token=\(UserSession.instance.token)&v=5.126").responseData { response in
            //print("!!!! success")
            //resolver.fulfill([User()])
//                let dispatchGroup = DispatchGroup()
                guard let data = response.value else { return }
//                DispatchQueue.global().async(group: dispatchGroup) {
                    let friends = try! JSONDecoder().decode(FriendsResponse.self, from: data)
                    SocialService.saveUserData(friends.response.items)
                    resolver.fulfill(friends.response.items)
//                }
            }
        }
        return promise
    }
    
//    static func friendsAF(completion: @escaping ([User]) -> Void){
//        AF.request("https://api.vk.com/method/friends.get?user_id=\(UserSession.instance.userId)&order=name&count=5&fields=city&access_token=\(UserSession.instance.token)&v=5.126").responseData {
//            response in
//
//            let dispatchGroup = DispatchGroup()
//            guard let data = response.value else { return }
//            DispatchQueue.global().async(group: dispatchGroup) {
//            let friendns = try! JSONDecoder().decode(FriendsResponse.self, from: data)
//            saveUserData(friendns.response.items)
//            completion(friendns.response.items)
//        }
//    }
//    }
////



    static func photoAF(completion: @escaping ([Photo]) -> Void ){
        AF.request("https://api.vk.com/method/photos.get?owner_id=\(UserSession.instance.userId)&album_id=wall&count=3&access_token=\(UserSession.instance.token)&v=5.126").responseData {
            response in
        
            let dispatchGroup = DispatchGroup()
            guard let data = response.value else { return }
            DispatchQueue.global().async(group: dispatchGroup){
            let photos = try? JSONDecoder().decode(PhotografyResponse.self, from: data)
            savePhotoData(photos?.response.items ?? [])
            completion(photos?.response.items ?? [])
        }
        }
    }
    
    
    
    static func groupAF(completion: @escaping ([Group]) -> Void){
        AF.request("https://api.vk.com/method/groups.get?user_ids=\(UserSession.instance.userId)&extended=1&count=3&access_token=\(UserSession.instance.token)&v=5.126").responseData {
            response in
        
            let dispatchGroup = DispatchGroup()
            guard let data = response.value else { return }
            DispatchQueue.global().async(group: dispatchGroup){
            let groups = try! JSONDecoder().decode(GroupSocialResponse.self, from: data)
            saveGroupData(groups.response.items)
            completion(groups.response.items)
        }
        }
    }
    
    // Новостная лента
//    static func newsAF(completion: @escaping ([Post]) -> Void){
//        AF.request("https://api.vk.com/method/newsfeed.get?user_ids=\(UserSession.instance.userId)&extended=1&count=3&access_token=\(UserSession.instance.token)&v=5.126").responseData {
//            response in
//
//            let dispatchGroup = DispatchGroup()
//            guard let data = response.value else { return }
//            DispatchQueue.global().async(group: dispatchGroup){
//            let posts = try! JSONDecoder().decode(NewsResponse.self, from: data)
//            saveNewsData(posts.items)
//            completion(posts.items)
//        }
//        }
//    }
    
    
    func newsRequest(startFrom: String = "",
                     startTime: Double? = nil,
                     completion: @escaping (Swift.Result<[Post], Error>, String) -> Void) {
       
        let path = "/method/newsfeed.get"
        let baseUrl = "https://api.vk.com"
        var params: Parameters = [
            "access_token": UserSession.instance.token,
            "filters": "post",
            "v": "5.87",
            "count": "20",
            "start_from": startFrom
        ]
       
        if let startTime = startTime {
            params["start_time"] = startTime
        }
       
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: .global()) { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(error), "")
            case .success(let value):
                let json = JSON(value)
                var friends = [User]()
                var groups = [Group]()
                let nextFrom = json["response"]["next_from"].stringValue
               
                let parsingGroup = DispatchGroup()
                DispatchQueue.global().async(group: parsingGroup) {
                    friends = json["response"]["profiles"].arrayValue.map { User(value: $0) }
                }
                DispatchQueue.global().async(group: parsingGroup) {
                    groups = json["response"]["groups"].arrayValue.map { Group(value: $0) }
                }
                parsingGroup.notify(queue: .global()) {
                    let news = json["response"]["items"].arrayValue.map { Post(value: $0) }
                   
                    news.forEach { newsItem in
                        if newsItem.sourceId > 0 {
                            let source = friends.first(where: { $0.id == newsItem.sourceId })
                          
                        } else {
                            let source = groups.first(where: { $0.id == -newsItem.sourceId })
                            
                        }
                    }
                    DispatchQueue.main.async {
                        completion(.success(news), nextFrom)
                    }
                }
            }
        }
    }


// Сохранение данных в Realm
    static func saveUserData(_ users: [User]) {
          do {
              let realm = try Realm()
              realm.beginWrite()
              realm.add(users)
              try realm.commitWrite()
          } catch {
              print(error)
          }
      }
    
    static func savePhotoData(_ photos: [Photo]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(photos)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    static func saveGroupData(_ groups: [Group]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(groups)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    static func saveNewsData(_ news: [Post]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(news)
            try realm.commitWrite()
        } catch {
            print(error)
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
    
    
    private func saveToFirestore(_ users: [User], userName: String) {
        
        let database = Firestore.firestore()
//        let settings = database.settings
////        settings.areTimestampsInSnapshotsEnabled = true
//        database.settings = settings

        let usersToSend = users
            .map { $0.toFirestore() }
            .reduce([:]) { $0.merging($1) { (current, _) in current } }
        database.collection("forecasts").document(self.apiKey).setData(usersToSend, merge: true) { error in
        if let error = error {
            print(error.localizedDescription)
            } else { print("data saved")}
        }
    }
}
