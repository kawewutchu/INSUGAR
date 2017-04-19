//
//  MenuController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/6/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class MenuController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var sizePicker: UIPickerView!
    @IBOutlet weak var menuPicker: UIPickerView!
    var menuList = Menu()
    var menulist = Foundation.UserDefaults.standard
    var menu = ["ข้าวกะเพรา","ข้าวผัด","ข้าวไขเจียว"]
    var size = ["เล็ก","ธรรมดา","พิเศษ"]
    var menuselect = [100,150,200]
    var sizeselect = [1,2,3]
    var sugar = 100
    var menuSugar = "ข้าวกะเพรา"
    var dic = [[String: String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sizePicker.dataSource = self
        self.sizePicker.delegate = self
        self.menuPicker.dataSource = self
        self.menuPicker.delegate = self
        menuList.name.append("kawewut")
        
        //self.menulist.set("lhsdlfkhlsadf", forKey: "name")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveBtnPress(_ sender: Any) {
    }
    
    func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menu[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == menuPicker){
            return menu.count
        }else{
            return size.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if(pickerView == menuPicker){
            let titleData = menu[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.black])
            return myTitle
        }else{
            let titleData = size[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.black])
            return myTitle
        }
      
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if(pickerView == menuPicker){
            sugar = menuselect[row]
            menuSugar = menu[row]
        }else{
            sugar *= sizeselect[row]
        }
        
       
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if(menulist.object(forKey: "menu") as! [[String : String]] != nil){
            dic = menulist.object(forKey: "menu") as! [[String : String]]

        }
        dic.append([ "menu": menuSugar, "sugar": String(sugar)])
        self.menulist.set(dic , forKey: "menu")
        print("-------------------")
        print(menulist.object(forKey: "menu"))
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
