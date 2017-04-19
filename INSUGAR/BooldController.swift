//
//  BooldController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/24/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit
import Firebase
class BooldController: UIViewController ,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive : Bool = false
    var insurin = [Insurin]()
    //var date = [String()]
    //var insurin = [String()]
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        searchBar.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

//     func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  insurin.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BooldCell
        print(found)
        if(found == 1){
            cell.insulin.text = "น้ำตาล " + i2[indexPath.row].Sugar! + " g"
            cell.date.text = i2[indexPath.row].Date!

        }else if(found == 2){
            cell.insulin.text = "น้ำตาล " + insurin[indexPath.row].Sugar! + " g"
            cell.date.text = insurin[indexPath.row].Date!
        }else if(found == 3){
            cell.insulin.text = ""
            cell.date.text = ""
        }
        return cell
    }
    
    func fetchData() {
        FIRDatabase.database().reference().child("carbohydrate").observe(.childAdded, with: { (snapshot) in
            let id = FIRAuth.auth()!.currentUser!.uid
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let insurin2 = Insurin()
                print(id)
                if(id == dictionary["Id"] as? String){
                    insurin2.setValuesForKeys(dictionary)
                    self.insurin.append(insurin2)
                }
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
                
            }
            
        }, withCancel: nil)
    }

    var index = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        self.performSegue(withIdentifier: "show", sender: self)

    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.reloadData()
        searchActive = false;
        self.searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         tableView.reloadData()
        searchActive = false;
        self.searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchActive = false;
        self.searchBar.endEditing(true)
    }
    var found = 2
    var i2 = [Insurin]()
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("kuy")
        i2.removeAll()
       
        for i in 0 ... (insurin.count - 1){
            if(insurin[i].Date?.contains(searchText))!{
                i2.append(insurin[i])
            }
        }
        print(i2.count)
        if(searchText != ""){
            if(i2.count == 0){
                found =  3
            } else {
                found = 1
            }
        }else{
             self.searchBar.endEditing(true)
            found = 2
        }
        print(found)
        self.tableView.reloadData()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            if let view = segue.destination as? ShowHistoryController {
                view.history = insurin[index]
            }
        }
    }
    

}
