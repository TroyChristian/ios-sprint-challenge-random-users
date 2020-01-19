//
//  ImageService.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    static func downloadImage(withURL url:URL, completion: @escaping (_ image:UIImage?)->()){
        let dataTask = URLSession.shared.dataTask(with:url)  {data, url, error in
            var downloadedImage:UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data:data)
                completion(downloadedImage)
            }
            DispatchQueue.main.async{
           
            }
          
            
    }
         dataTask.resume()
}
}
