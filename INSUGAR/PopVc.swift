//
//  PopVc.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/23/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit
protocol UIPopoverControllerDelegate{
    func valuesChanged(_ changedValue:String)
}


class PopVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var text = ["    ❶    Rapid Insulin","Insulin Lispro (Humalog)","Insulin aspart (NovoRapid)","Insulin Glulisine (Aprida)","     ❷    Short Insulin","Actrapid Hm","Humulin R","Gensulin R","Insugen R","Insuman Rapid"]
    var text2 = ["0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1.0","1.1","1.2","1.3","1.4","1.5","1.6","1.7","1.8","1.9","2.0"]
    var s = [String()]
    var btn = 0
    @IBOutlet weak var tableView: UITableView!
    var asset:Int!
    var tdd = Foundation.UserDefaults.standard
    var delegate: UIPopoverControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = tdd.object(forKey: "btn") as! Int
        if(btn == 0){
            s = text2
        }else{
            s = text
        }
        // Do any additional setup after loading the view.
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return s.count;
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "popcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "popcell");
        }

        if(btn == 1){
                cell!.textLabel?.text = s[indexPath.row]
        if(indexPath.row == 0 || indexPath.row == 4){
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            //cell?.selectionStyle = UITableViewCellSelectionStyle.gray
            }
            
        }else{
            //print(s[indexPath.row])
            cell!.textLabel?.text = s[indexPath.row]
        }
        return cell!
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(btn == 1){
            if(indexPath.row != 0 || indexPath.row != 4){
                if(indexPath.row < 4){
                    tdd.set(text[indexPath.row], forKey: "med")
                    tdd.set(1500, forKey: "mutiple")
                }else{
                    tdd.set(text[indexPath.row], forKey: "med")
                    tdd.set(1800, forKey: "mutiple")
                }
                print(text[indexPath.row])
                delegate?.valuesChanged("some value")
                dismiss(animated: true, completion: nil)

            }
        }else{
            tdd.set(Double(text2[indexPath.row]), forKey: "weight")
            dismiss(animated: true, completion: nil)
        }
    }
}
