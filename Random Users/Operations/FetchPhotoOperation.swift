//
//  FetchPhotoOperation.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/20/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import Foundation

class FetchPhotoOperation: ConcurrentOperation {
    
    let photoRef:String
    var imgData:Data?
    private var dataTask:URLSessionDataTask?
    
    init(photoRef:String) {
        self.photoRef = photoRef
        super.init()
    }
    
    override func start() {
        state = .isExecuting
        
        guard let thumbnailURL = URL(string: photoRef)?.usingHTTPS else {return}
        
        dataTask = URLSession.shared.dataTask(with:thumbnailURL) { data, _, error in
            if let error = error {
                print("error line 29 PhotoOp")
                return
            }
            
            guard let data = data else {return}
            self.imgData = data
            self.state = .isFinished
    }
        
        dataTask?.resume()
}
    override func cancel() {
        dataTask?.cancel()
    }
}
