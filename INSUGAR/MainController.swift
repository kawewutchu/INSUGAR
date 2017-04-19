//
//  MainController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/11/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func CAL(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }

    @IBAction func BLOOD(_ sender: Any) {
        self.tabBarController?.selectedIndex = 3
        
    }
    @IBAction func NEWS(_ sender: Any) {
        self.tabBarController?.selectedIndex = 2
        
    }
    @IBAction func SETTING(_ sender: Any) {
        self.tabBarController?.selectedIndex = 4
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
