//
//  ShowHistoryController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 4/6/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class ShowHistoryController: UIViewController {
    var history = Insurin()
    @IBOutlet weak var unitshort: UILabel!
    @IBOutlet weak var shrot: UILabel!
    @IBOutlet weak var unitlong: UILabel!
    @IBOutlet weak var tatal: UILabel!
    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var day: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(history.Long!)
        tatal.text = "รวม : " + String(Int(history.UnitLong!)! + Int(history.UnitShort!)!)
        day.text = "วัน/เดือน/ปี " + history.Date! +  " เวลา:  " + history.Time!
        sugar.text = "ค่าน้ำตตาลในเลือด: " + history.Sugar! + " g"
        long.text = "อินซูลินออกฤทธิ์ยาว: " + history.Long!
        unitlong.text = "จำนวนการฉีด:  " + history.UnitLong! + "ยูนิต"
        shrot.text = "ยาฉีดอินซูลิน: " + history.Short!
        unitshort.text = "จำนวนการฉีด:  " + history.UnitShort! + " ยูนิต"
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
