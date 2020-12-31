//
//  FirebaseUser.swift
//  Social App
//
//  Created by Alexander Novikov on 19.12.2020.
//

import Foundation
import Firebase


class FirebaseUser {
    let name: String
    let idcode: Int
    let ref: DatabaseReference?
    
    init(name: String, idcode: Int) {
        self.ref = nil
        self.name = name
        self.idcode = idcode
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let idcode = value["idcode"] as? Int,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.idcode = idcode
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            "name": name,
            "idcode": idcode
        ]
    }
}
