//
//  AllMenuController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/11/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class AllMenuController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet weak var sugarLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var add: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var menu = [[String:String]]()
    var menulist = Foundation.UserDefaults.standard
    var sugar = 0
    var type = String()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type)
        tableView.tableFooterView = UIView(frame: .zero)
        if(type == "food"){
            var test = Menu()
            valueLbl.text = "ปริมาณ"
            sugarLbl.text = "น้ำตาล"
            test.name = ["sadfdf"]
            test.cal = ["10000"]
          
            if (menulist.object(forKey: "menu") != nil){
                print(menulist.object(forKey: "menu") as! [[String : String]])
                menu = menulist.object(forKey: "menu") as! [[String : String]]
                self.tableView.reloadData()
                print(menu)
            }
            if(menu.count == 0){
                self.tableView.isHidden = true
                self.add.isHidden = false
                self.label.isHidden = false
            }else{
                self.tableView.isHidden = false
                self.add.isHidden = true
                self.label.isHidden = true
            }
        }else{
            var test = Menu()
            test.name = ["sadfdf"]
            test.cal = ["10000"]
            valueLbl.text = "เวลา"
            sugarLbl.text = "พลังงาน"
            if (menulist.object(forKey: "active") != nil){
                print(menulist.object(forKey: "active") as! [[String : String]])
                menu = menulist.object(forKey: "active") as! [[String : String]]
                self.tableView.reloadData()
                print(menu)
            }
            if(menu.count == 0){
                self.tableView.isHidden = true
                self.add.isHidden = false
                self.label.isHidden = false
            }else{
                self.tableView.isHidden = false
                self.add.isHidden = true
                self.label.isHidden = true
            }
            
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if(type == "food"){
            if (menulist.object(forKey: "menu") != nil){
                menu.removeAll()
                menu = menulist.object(forKey: "menu") as! [[String : String]]
                self.tableView.reloadData()
                print(menu)
            }
            if(menu.count == 0){
                self.tableView.isHidden = true
                self.label.isHidden = false
            }else{
                self.tableView.isHidden = false
                self.label.isHidden = true
            }
            sugar = 0
            for i in menu {
               // let first = i["sugar"]!.components(separatedBy: " ").first
                if(i["sugar"]! != nil){
                    sugar += (i["sugar"]! as NSString).integerValue
                }
            }
            menulist.set(String(sugar), forKey: "sugar")
        }else{
            if (menulist.object(forKey: "active") != nil){
                menu.removeAll()
                menu = menulist.object(forKey: "active") as! [[String : String]]
                self.tableView.reloadData()
                print(menu)
            }
            if(menu.count == 0){
                self.tableView.isHidden = true
                self.label.isHidden = false
            }else{
                self.tableView.isHidden = false
                self.label.isHidden = true
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menu.count)
        return menu.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllmenuCell
        if(type == "food"){

            cell.value.text = menu[indexPath.row]["value"]
            cell.name.text = menu[indexPath.row]["menu"]
            cell.cal.text = menu[indexPath.row]["sugar"]
            
        }else{
            cell.value.text = menu[indexPath.row]["value"]
            cell.name.text = menu[indexPath.row]["menu"]
            cell.cal.text = menu[indexPath.row]["sugar"]
        }
        
        return cell
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            print(indexPath.row)
            if(type == "food"){
                menu.remove(at: indexPath.row)
                tableView.reloadData()
                menulist.set(menu, forKey: "menu")
                sugar = 0
                for i in menu {
                    // let first = i["sugar"]!.components(separatedBy: " ").first
                    if(i["sugar"]! != nil){
                        sugar += (i["sugar"]! as NSString).integerValue
                    }
                }
                print(sugar)
                menulist.set(String(sugar), forKey: "sugar")
            }else{
                menu.remove(at: indexPath.row)
                tableView.reloadData()
                menulist.set(menu, forKey: "active")

            }
        }
    }

  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        index = indexPath.row
        self.performSegue(withIdentifier: "show", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            if let view = segue.destination as? ValueController {
                view.index = index
                view.type = type
            }
        }
        
        if segue.identifier == "show2" {
            if let view = segue.destination as? Menu2Controller {
                
                view.type = type
            }
        }
    }
}
