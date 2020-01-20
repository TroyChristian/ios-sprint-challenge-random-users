//
//  Cache.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//
import UIKit
import Foundation
class Cache<Key: Hashable, Value>{
     var dict = [Key:Value]()
    let queue = DispatchQueue(label:"CacheQueue")
  
    
func cache(value: Value, for key: Key){
        queue.sync{
            self.dict[key] = value
        } }
    

func value(for key: Key) -> Value? {
    queue.sync {
         return dict[key]
    }
    
}

func contains( _ key: Key) -> Bool {
            return queue.sync {
                dict.keys.contains(key)
        }
  
    }
    
//    static func storeImage(urlString: String, img: UIImage){
//        let path = NSTemporaryDirectory().appending(UUID().uuidString)
//        let localUrl = URL(fileURLWithPath: path)
//
//        let data =   UIImageJPEGRepresentation(img, 0.5)
//        try? data?.write(to: localUrl)
//
//
//        var localDict = UserDefaults.standard.object(forKey: "ImageCache") as! [String : String]
//       // if localDict == nil {
//           // localDict = [String:String]()
//
//
//        dict[urlString] = path
//        localDict[urlString] = path
        
        
   // }
    
//    static func loadImage(urlString:String, completion: @escaping (String,UIImage?) -> Void) {
//
//    }
}
    

