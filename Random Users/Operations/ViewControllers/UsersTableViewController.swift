//
//  UsersTableViewController.swift
//  Random Users
//
//  Created by Lambda_School_Loaner_219 on 1/17/20.
//  Copyright © 2020 Erica Sadun. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
// puting APIController here to test functions
   //var usersPopulatingTableView = [UserDetail]()
    let apiController = APIController.sharedAPIController
    var url = "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000"
    let cache = Cache<User, Data>()
    let DetailPhotoCache = Cache<User, Data>()
    let photoGrabberQueue = OperationQueue()
    var operations = [User: Operation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiController.fetchResults {  (error)  in
        if let error = error {
            print(error)
            return
        }
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
            
        
    }
       
    }
    
    
        
        
        
        
        
    
    
      
       
        

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Rows init")
        return 0
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { print ("RETURNING LINE 38") ; return UITableViewCell()}

      
        
      

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
