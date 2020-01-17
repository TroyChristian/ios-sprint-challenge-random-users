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


struct Results: Codable {
    var results:[ResultsDetail]
}
struct ResultsDetail: Codable {
    var email:String
    var phone:String
    var name:Name
    var picture:Picture
}

struct Name: Codable {
    var title:String
    var first:String
    var last:String
    
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}
