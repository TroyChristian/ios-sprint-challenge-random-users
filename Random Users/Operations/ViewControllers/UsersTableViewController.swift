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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiController.fetchAllUsers(for: url, completion: { result in
            try? result.get() })
        print(apiController.usersList?.results.count)
                
            
        
        }
        
        
        
    
    
      
       
        

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Rows init")
        return apiController.usersList?.results.count ?? 0
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { print ("RETURNING LINE 38") ; return UITableViewCell()}

        guard  let currentUser = apiController.usersList?.results[indexPath.row] else {  return UITableViewCell()  }
        
        cell.title.text? = (currentUser.name.title)
        cell.firstName.text? = (currentUser.name.first)
        cell.lastName.text? = (currentUser.name.last)
        apiController.fetchImage(at: currentUser.picture.thumbnail, completion: { result in
            if let userThumbnail = try? result.get() {
                cell.thumbnail.image = userThumbnail
            }})
        

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
