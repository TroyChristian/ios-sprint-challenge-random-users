//
//  DetailViewController.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailPicture: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var first: UILabel!
    
    @IBOutlet weak var last: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
   
    var user:User?
    var imgData:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let user = user else {return}
        if let imgData = imgData {
            detailPicture.image = UIImage(data:imgData)
        }
        titleLabel.text? = user.name.title
        first.text? = user.name.first
        last.text? = user.name.last
        
        email.text? = user.email
        phoneNumber.text? = user.phone
        
    }
    



}
