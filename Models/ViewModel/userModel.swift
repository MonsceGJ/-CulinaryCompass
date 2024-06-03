//
//  userModel.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import Foundation



struct User {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "email": email,
            "joined": joined
        ]
    }
}
