//
//  APIController.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noAuth
    case badResponse
    case otherError
    case badData
    case noDecode
}


class APIController {
    var users = [Users]()
   var url = URL(string: "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000")!
    
    func fetchAllUsers(){
        var request = URLRequest(url:url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        /*
          func getAllClasses(completion: @escaping ([FitnessClassRepresentation]?, Error?) -> Void)
         URLSession.shared.dataTask(with: request) { data, _, error in
             if let _ = error {
                 print("Error")
                 completion(nil, error)
                 return
             }
             guard let data = data else {
                 print("Bad Data")
                 return
             }

             let decoder = JSONDecoder()
             decoder.keyDecodingStrategy = .convertFromSnakeCase
             do {
                 let fitnessClasses = try decoder.decode([FitnessClassRepresentation].self, from: data)
                 completion(fitnessClasses, nil)
         */
        
        URLSession.shared.dataTask(with:request) {data, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                print("bad response: \(String(describing: error))")
              
            }
            
            if let error = error {
                print("Error thrown during data task fetching 1000 users from server: \(error)")
               
                
            }
            
            guard let data = data else {
                print("data not recieved: \(String(describing: error))")
              
                return
            }
            
           let decoder = JSONDecoder()
            
            do {
                let users = try decoder.decode(Users.self, from:data)
              
                print("Success fetching users from server")
                
            } catch {
                print("Error decoding users from data into user object: \(error)")
             
                return
            }
            
        
        
       
        
        }.resume()
    
    
    
}
}

