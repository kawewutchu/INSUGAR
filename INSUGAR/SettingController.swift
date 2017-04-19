//
//  SettingController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/4/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit
import Firebase
class SettingController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var myswich: UISwitch!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var tel: UILabel!
    
    var noti2 = true;
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData() {
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            let id = FIRAuth.auth()!.currentUser!.uid
            if let dictionary = snapshot.value as? [String: AnyObject] {
            if(snapshot.key == id){
                print(dictionary["name"])
                
                self.name.text =  "ชื่อ    : " + (dictionary["name"]! as! String)
                
                self.birth.text = "วันเกิด : " + (dictionary["birth"]! as! String)
                self.age.text =   "อายุ   : " + (dictionary["age"]! as! String)
                self.tel.text =   "โทร   : " + (dictionary["tel"]! as! String)
 
                }
               print(dictionary)
                
            }
            
        }, withCancel: nil)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        return true
    }
    
    @IBAction func noti(_ sender: Any) {
        if myswich.isOn {
            noti2 = true
        }
        else{
            noti2 = false
        }
    }
    
    @IBOutlet weak var logout: UIButton!
    @IBAction func logoutPressed(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        self.performSegue(withIdentifier: "show", sender: self)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
