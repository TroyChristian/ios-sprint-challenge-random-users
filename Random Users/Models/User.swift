//
//  User.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation
// dictionary results results holds a list of objects(users)
// dictionary order results -> name -> picture
// the name dictionary holds(title, first, last) the picture dictionary holds(large, medium, thumbnail)

// need phone number and email address


struct User: Codable, Hashable {
    

enum UserKeys: String, CodingKey {
    case name
    case email
    case phone
    case picture
}

    var email:String
    var phone:String
    var name:Name
    var picture:Picture
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy:UserKeys.self)
        
        self.name = try container.decode(Name.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.picture = try container.decode(Picture.self, forKey: .picture)
        
    }
}

struct Name: Codable, Hashable {
    enum NameKeys: String, CodingKey {
        case title
        case first
        case last
    }
    var title:String
    var first:String
    var last:String
    
}


struct Picture: Codable, Hashable {
    enum PictureKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
    var large: String
    var medium: String
    var thumbnail: String
}

struct Results: Codable {
    enum ResultKey: String, CodingKey {
        case results
    }
    
    var results: [User]
    
    init() {
        self.results = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultKey.self)
        var userContainer = try container.nestedUnkeyedContainer(forKey: .results)
        var placeholder = [User]()
        while !userContainer.isAtEnd {
            let user = try userContainer.decode(User.self)
            placeholder.append(user)
        }
        self.results = placeholder
    }
}
