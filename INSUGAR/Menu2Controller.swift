//
//  Menu2Controller.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/19/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class Menu2Controller: UIViewController ,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    @IBOutlet weak var TabelView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    var searchActive : Bool = false
    var filteredMenu:[String] = []
    var filteredCarbo:[String] = []
    var filteredValue:[String] = []
    var menulist2 = Foundation.UserDefaults.standard
    var dic = [[String: String]]()
    var type = String()
    let searchController = UISearchController(searchResultsController: nil)
    var Menu = ["ข้าวราดแกง","ข้าวราดแกงขี้เหล็ก","ข้าวราดแกงเขียวหวานไก่","ข้าวราดแกงคั่วสับปะรด (เจ)","ข้าวราดแกงฉู่ฉี่ปลาทู" , "ข้าวราดแกงไตปลา","ข้าวราดแกงคั่วกลิ้งหมู" , "ข้าวราดแกงเทโพหมูสามชั้น" , "ข้าวราดแกงพะแนงหมู", "ข้าวราดแกงมัสมั่นไก่" , "ข้าวราดแกงส้มชะอมทอด" , "ข้าวราดแกงส้มผักรวม" ,"ข้าวราดแกงเหลือง" , "ข้าวราดไข่เจียวหมูสับ" , "ข้าวราดไข่เจียวสมุนไพร" ,"ข้าวราดต้มกะทิสายบัว" , "ข้าวกล้องราดต้มจับฉ่าย (เจ)" , "ข้าวราดต้มจืดเต้าหู้หมูสับ" ,"ข้าวราดต้มหมูพะโล้กับไข่" ,"ข้าวราดทอดมันปลากราย"," ข้าวราดผัดกระเพราไก่","ข้าวราดผัดกระเพราตับ","ข้าวราดผัดคะน้าหมูกรอบ" ,"ข้าวราดผัดฉ่าปลากระเบน" ,"ข้าวราดผัดฉ่าปลากะพง","ข้าวราดผัดฉ่าปลาดุก" ,"ข้าวราดผัดเต้าหู้ไข่ทรงเครื่อง", "ข้าวราดผัดผักรวม" ,"ข้าวราดผัดเผ็ดไก่กับหน่อไม้ดอง" ,"ข้าวราดผัดเผ็ดปลาดุกสด" ,"ข้าวราดผัดเผ็ดหอยแมลงภู่" ,"ข้าวราดผัดเผ็ดหอยลาย" ,"ข้าวราดผัดพริกขิงใส่ถั่วฝักยาว" ,"ข้าวราดผัดฟักทองกับไข่" , "ข้าวราดผัดถั่วงอกกับเต้าหู้" ,"ข้าวราดผัดมะเขือยาวกับหมูสับ","ข้าวราดผัดมะระกับไข่","ข้าวราดหมูทอดกระเทียม","ข้าวราดหมูสับผัดแม็กกี้","ข้าวกล้องราดลาบเห็ด(เจ)","ข้าวราดยำไข่ดาว","ข้าวราดยำมะเขือยาวกับไข่ต้ม","ข้าวราดยำหมูยอ","กับข้าว","เกาเหลาเนื้อตุ๋น","เกาเหลาหมู","แกงเลียง","ลาบปลาดุก","ต้มเลือดหมู","ซุปเนื้อวัว","น้ำพริกปลาทู+ผักลวก+ผักสด","น้ำพริกกะปิ+ปลาทูทอด+ชะอมชุบไข่","ปลาทู 3 รส","เต้าเจี้ยวหลน+ผักสด","ก๋วยเตี๋ยวน้ำ","ก๋วยเตี๋ยวเส้นเล็กน้ำ หมูเรียง","ก๋วยเตี๋ยวเส้นเล็กหมู น้ำตก","ก๋วยเตี๋ยวแคระ เส้นเล็กน้ำ" , "ก๋วยเตี๋ยวเส้นเล็กน้ำ ลูกชิ้น เนื้อสด","ก๋วยเตี๋ยวเส้นเล็กหมู ต้มยำ","ก๋วยเตี๋ยวเส้นใหญ่ลูกชิ้นหมูตุ๋น","ก๋วยเตี๋ยวเส้นใหญ่น่องไก่ตุ๋นยาจีน" ,"ก๋วยเตี๋ยวเส้นใหญ่ เย็นตาโฟ" , "ก๋วยเตี๋ยวเส้นใหญ่ ใส่ปลาลวก", "ก๋วยเตี๋ยวเส้นหมี่หมู ต้มยำ" ,"ก๋วยเตี๋ยวเส้นหมี่ลูกชิ้น น้ำใส" ,"ก๋วยเตี๋ยวเส้นหมี่เนื้อรวม น้ำตก","ก๋วยเตี๋ยวน้ำ เส้นเซี่ยงไฮ้","เกี้ยวนน้ำ", "บะหมี่เกี้ยวหมูแดง" ,"วุ้นเส้นเย็นตาโฟ","ก๋วยเตี๋ยวแห้ง","ก๋วยเตี๋ยวคั่วไก่","ก๋วยเตี๋ยวเส้นเล็กแห้งหมู","ก๋วยเตี๋ยวเส้นหมี่แห้งหมูตุ๋น","ก๋วยเตี๋ยวหลอด","บะหมี่แห้งหมู","บะหมี่แห้งหมู","บะหมี่แห้งหมู","อาหารอื่นๆ","ก๋วยจั๊บน้ำข้น","กระเพาะปลาเส้นหมี่","ขนมจีนน้ำเงี้ยว","ขนมจีนแกงเขียวหวาน","ขนมจีนน้ำยากะทิ","ข้าวคลุกกะปิ+ผักแนม","ข้าวผัดหมู","ข้าวหมกไก่+อาจาด","ข้าวหมูแดง+น้ำราด","ข้าวหมูอบ","ข้าวมันไก่","ผัดไทกุ้งสด(ไม่รวมผักสด)","สุกี้ไก่ น้ำ","สุกี้รวมมิตร น้ำ","สุกี้รวมมิตร แห้ง","เส้นใหญ่ผัดซีอิ้ว","เส้นใหญ่ราดหน้าหมู","เส้นใหญ่ราดหน้าหมูสับ","หมี่กรอบราดหน้าทะเล","หอยทอด"]
    
    var Carbo = ["","52.7","45.5","63.1" ,"45.0","63.9","59.8","49.7","60.0","65.7","56.6","65.9" ,"68.9" ,"54.5" ,"68.0" , "64.0", "60.3" , "25.0" , "66.3" ,"68.8" , "59.9","71.2" ,"67.2" ,"47.7" ,"64.9" ,"50.0", "54.5","60.9" ,"58.2" ,"64.9" ,"64.4","48.2" ,"59.5" ,"81.8" ,"62.7","70.7" ,"57.9","71.0","68.6", "64.4","75.3","50.5","58.2","","6.6","9.8","21.0","6.2","6.2","1.3","14.2","8.5","14.5","47.1","","61.6","66.6","53.6","37.2","54.6","33.5","42.9","42.0","51.5","53.2" ,"29.8","34.0","22.6","12.6","41.4","63.1","","59.4","84.3","32.7","52.5","42.8","42.8","42.8","","46.9","39.0","45.6","43.4","32.1","76.7","65.8","66.1","71.3","58.9","80.9","55.7","29.6","17.9","39.4","81.9","60.9","56.2","50.8","35.1"]
    
    var value = ["","306.0","278.0","238.0","321.0","252.0","295.0","350.0","288.0","353.0","370.0","371.0","325.0","342.0",
        "276.0","358.0","355.0","473.0","338.0","334.0","270.0","262.0","331.0","315.0","247.0","395.0","355.0","282.0",
        "268.0","345.0","295.0","217.0","283.0","362.0","311.0","304.0","328.0","228.0","247.0","279.0","366.0","316.0",
        "316.0","","310.0","506.0","392.0","109.0","600.0","443.0","329.0","331.0","136.0","307.0","","507.0","572.0",
        "467.0","377.0","438.0","597.0","535.0","518.0","493.0","550.0","571.0","365.0","447.0","523.0","485.0","498.0",
        "250.0","265.0","253.0","388.0","244.0","553.0","412.0","480.0","370.0","342.0","325.0","315.0","348.0","352.0",
        "248.0","259.0","281.0","540.0","530.0","384.0","320.0","450.0","450.0","399.0","261.0"
        ]
    
    var active = ["ว่ายน้ำ","แบดมินตัน"]
    var valueactive = ["0","0"]
    
    override func viewDidLoad() {
       
        SearchBar.delegate = self
        TabelView.delegate = self
        TabelView.dataSource = self
        
    }

    
  
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         if(type == "food"){
            filteredMenu.removeAll()
            filteredCarbo.removeAll()
            for i in 0 ... (Menu.count - 1){
                if(Menu[i].contains(searchText)){
                    filteredMenu.append(Menu[i])
                    filteredCarbo.append(Carbo[i])
                    filteredValue.append(value[i])
                }
            }
            if(filteredMenu.count == 0){
                searchActive = false;
            } else {
                searchActive = true;
            }
            self.TabelView.reloadData()
         }else{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(type == "food"){
            
            if(searchActive) {
                return filteredMenu.count
            }
            return Menu.count;
        }else{
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCell
        if(type == "food"){

            if(searchActive){
                cell.name.text = filteredMenu[indexPath.row]
                cell.sugar.text = filteredCarbo[indexPath.row]
            } else {
                cell.name.text = Menu[indexPath.row]
                cell.sugar.text = Carbo[indexPath.row]
            }
        }else{
            cell.name.text = active[indexPath.row]
            cell.sugar.text = valueactive[indexPath.row]
        }
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if(type == "food"){
            if(searchActive){
                if(filteredCarbo[indexPath.row] != ""){
                    if(menulist2.object(forKey: "menu") != nil)
                    {
                        dic = menulist2.object(forKey: "menu") as! [[String : String]]
                    }
                    
                    dic.append([ "menu": filteredMenu[indexPath.row], "sugar": filteredCarbo[indexPath.row],"value":filteredValue[indexPath.row]])
                    //self.menulist2.set( filteredValue[indexPath.row], forKey: "menu")
                    self.menulist2.set(dic , forKey: "menu")
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                if(Carbo[indexPath.row] != ""){
                    print(menulist2.object(forKey: "menu"))
                    if(menulist2.object(forKey: "menu") != nil){
                        dic = menulist2.object(forKey: "menu") as! [[String : String]]
                    }
                    
                    dic.append([ "menu": Menu[indexPath.row], "sugar": Carbo[indexPath.row],"value":value[indexPath.row]])
                    self.menulist2.set(dic , forKey: "menu")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }else{
            
            print(menulist2.object(forKey: "active"))
            if(menulist2.object(forKey: "active") != nil){
                dic = menulist2.object(forKey: "active") as! [[String : String]]
            }
            dic.append([ "menu": active[indexPath.row], "sugar": valueactive[indexPath.row], "value":"0"])
            self.menulist2.set(dic , forKey: "active")
            self.navigationController?.popViewController(animated: true)

        }
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
