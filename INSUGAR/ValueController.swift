//
//  ValueController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 4/15/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class ValueController: UIViewController ,UITextFieldDelegate{
    var menu = [[String:String]]()
    var menulist = Foundation.UserDefaults.standard
    var sugar = 0;
    var type = String()
    var index = 0
    var s = ""
   
    @IBOutlet weak var list: UILabel!
    @IBOutlet weak var value: UITextField!
    @IBOutlet weak var sugar2: UILabel!
   
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        print(type)
        if(type == "food"){
            var test = Menu()
            test.name = ["sadfdf"]
            test.cal = ["10000"]
            self.value.delegate = self 
            if (menulist.object(forKey: "menu") != nil){
                print(menulist.object(forKey: "menu") as! [[String : String]])
                menu = menulist.object(forKey: "menu") as! [[String : String]]
                print(menu)
                value.text = menu[index]["value"]
                list.text = menu[index]["menu"]
                sugar2.text = menu[index]["sugar"]
            }
        }else{
            var test = Menu()
            test.name = ["sadfdf"]
            test.cal = ["10000"]
            self.value.delegate = self
            if (menulist.object(forKey: "active") != nil){
                print(menulist.object(forKey: "active") as! [[String : String]])
                menu = menulist.object(forKey: "active") as! [[String : String]]
                print(menu)
                value.text = menu[index]["value"]
                list.text = menu[index]["menu"]
                sugar2.text = menu[index]["sugar"]
            }

            
        }
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(type == "food"){
            if (menulist.object(forKey: "menu") != nil){
                menu.removeAll()
                menu = menulist.object(forKey: "menu") as! [[String : String]]
                
                print(menu)
            }
        }else{
        
        }
    
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(type == "food"){
            s = String(format: "%.2f", (Double(value.text!)!*Double(menu[index]["sugar"]!)!)/Double(menu[index]["value"]!)!)
            sugar2.text = s
        }else{
            
        }


    }
    
    @IBAction func save(_ sender: Any) {
        if(type == "food"){
            menu[index]["sugar"] = s
            menu[index]["value"] = value.text!
            print(menu)
            menulist.set(menu, forKey: "menu")
          }else{
            
        }

    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(type == "food"){
            self.value.resignFirstResponder()
            
        }else{
            
        }
        
        return true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    

}
