//
//  Friends.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import Foundation


protocol UniversalModel {
    var avatar: String { get set }
    var title: String { get set }
}

struct Friends: UniversalModel {
    var avatar: String
    var title: String
}


