//
//  FirstViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 23.11.2020.
//


import Alamofire
import UIKit
import WebKit


let socialService = SocialService()
class UserSession {
    
   static let instance = UserSession()
    
        private init() { }
        
        var token: String = ""
        var userId: String = ""
}


class FirstViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7674193"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.126")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
        webView.load(request)
      
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
            }
        
        
            let token = params["access_token"]
            print(token)
            let userID = params["user_id"]
            print(userID)
     
        
        UserSession.instance.token = token ?? ""
        UserSession.instance.userId = userID ?? ""

//            SocialService.friendsAF()
//            SocialService.groupAF()
//            SocialService.photoAF()
//            socialService.loadGroupsData(Music: "DTF")
            
        // переход на след экран
        nextView()
        
            decisionHandler(.cancel)
        }
    
    func nextView(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabViewController") as! TabViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
}
