//
//  GetDataOperation.swift
//  Social App
//
//  Created by Alexander Novikov on 18.01.2021.
//

import Foundation
import Alamofire


class GetDataOperation: AsyncOperation {


    private var request: DataRequest = AF.request("https://api.vk.com/method/groups.get?user_ids=\(UserSession.instance.userId)&extended=1&count=3&access_token=\(UserSession.instance.token)&v=5.126")
        var data: Data?
        
    override func main() {
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
                self?.data = response.data
                self?.state = .finished
            }
        }

    override func cancel() {
            request.cancel()
            super.cancel()
        }
}


