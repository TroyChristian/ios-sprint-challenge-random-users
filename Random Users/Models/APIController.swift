//
//  APIController.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation
import UIKit
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
   static var sharedAPIController = APIController() 
    var users = Results()
    
   var baseUrl = URL(string: "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000")!
    
    func fetchAllUsers<T:Codable>(for target:String, completion: @escaping (T?, Error?)->Void)  {
        let url = URL(string:target)!
        var request = URLRequest(url:url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
     
        URLSession.shared.dataTask(with:request) {data, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(nil, error)
//                print("bad response: \(String(describing: error))")
                return
              
            }
            
            if let error = error {
                print("Error thrown during data task fetching 1000 users from server: \(error)")
                completion(nil, error)
                return
                
               
                
            }
            
            guard let data = data else {
                //print("data not recieved: \(String(describing: error))")
                completion(nil, error)
              
                return
            }
            
           let decoder = JSONDecoder()
            
            do {
                let users = try decoder.decode(T.self, from:data)
                print("Success fetching users from server")
                completion(users, nil)
                
                
                
                
                
               
                
            } catch {
                print("Error decoding users from data into user object: \(error)")
                completion(nil, error) 
             
                return
            }
            
        
        
       
        
        }.resume()
        
        
    
  
     
}
    
    func fetchResults(completion: @escaping (Error?) -> Void) {
        fetchAllUsers(for: "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000") { (results:Results?, error) in
            guard let results = results else {
                completion(error)
                return
            }
            self.users = results
            completion(nil) 
            
        }
        
        }
    

    func fetchImage( at urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        guard let userThumbnailURL = URL(string:urlString) else {
            completion(.failure(.badData))
            return
        }
        
        var request = URLRequest(url: userThumbnailURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with:request) { data, response, error in
            if let error = error {
                print("Error making fetchImage request: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                print("Error in response: \(response)")
                completion(.failure(.badResponse))
                return
                
            }
            
            guard let data = data else {
                print("Bad data")
                completion(.failure(.badData))
                return
            }
            
            guard let userThumbnail = UIImage(data:data) else {return}
            DispatchQueue.main.async {
                completion(.success(userThumbnail))
                
            }
            
            
    }
    
    
    
    
}

}
