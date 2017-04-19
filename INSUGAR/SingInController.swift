//
//  SingInController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/3/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit
import Firebase

class SingInController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.emailTextFiled.delegate = self
        self.passwordTextFiled.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailTextFiled.resignFirstResponder()
        self.passwordTextFiled.resignFirstResponder()
        return true
    }

    @IBAction func singinAction(_ sender: AnyObject) {
        if self.emailTextFiled.text == "" || self.passwordTextFiled.text == ""{
            
            let alert = UIAlertController(title: "Oops!",
                                          message: "plase enter username oand password",
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.signIn(withEmail: self.emailTextFiled.text! ,
                                   password: self.passwordTextFiled.text!,
                                   completion: { (user , Error) in
                                    
                    if Error == nil{
                        
                         self.performSegue(withIdentifier: "show", sender: self)
                        self.emailTextFiled.text = ""
                        self.passwordTextFiled.text = ""
                        
                    }
                    else{
                        let alert = UIAlertController(title: "Oops!",
                                                      message: Error?.localizedDescription,
                                                      preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel,
                                                      handler: nil))
                        self.present(alert, animated: true, completion: nil)
                       
                    }
            })
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "show" {
            
        }
    }
  
}

