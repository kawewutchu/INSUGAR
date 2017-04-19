//
//  KnowledgeController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/5/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class KnowledgeController: UITableViewController {

    @IBOutlet var k: UITableView!
    
    var list = ["แนะผู้ป่วยเบาหวานกินปลา ชี้ให้คุณค่าอาหารสูง",
                 "แนวทางดูแลรักษาผู้ป่วยโรคเบาหวานที่ขา/เท้า โดยมีข้อปฏิบัติแนะนำดังนี้",
                 "เบาหวานจอประสาทตา รู้เร็ว ป้องกัน รักษาได้",
                 "โสมไทยทางเลือกของเบาหวาน"
    ]
    var imagename = ["1.jpg","3.jpg","4.jpg","5.jpg"]
    var index = 0;
    @IBOutlet weak var SearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.k.delegate = self
        self.k.dataSource = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
       

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KnowledgeCell
        if(indexPath.row < list.count){
            cell.View.backgroundColor = UIColor.white
            cell.Label.text = list[indexPath.row]
            cell.k.image = UIImage(named: imagename[indexPath.row])

        }
       
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        index = indexPath.row
        self.performSegue(withIdentifier: "show", sender: self)
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
            if let NewsViewController: NewsViewController = segue.destination as? NewsViewController {
                NewsViewController.type = index
            }
        }
    }
    

}
