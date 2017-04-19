//
//  RegesterController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/3/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit
import Firebase
class RegesterController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var telTextFiled: UITextField!
    @IBOutlet weak var ageTextFiled: UITextField!
    @IBOutlet weak var birthTextFiled: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var repasswordTextFiled: UITextField!
    @IBOutlet weak var passwordTextFied: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.ageTextFiled.delegate = self
         self.birthTextFiled.delegate = self
         self.telTextFiled.delegate = self
         self.nameTextField.delegate = self
         self.emailTextField.delegate = self
         self.repasswordTextFiled.delegate = self
         self.passwordTextFied.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.ageTextFiled.resignFirstResponder()
        self.birthTextFiled.resignFirstResponder()
        self.telTextFiled.resignFirstResponder()
        self.nameTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.repasswordTextFiled.resignFirstResponder()
        self.passwordTextFied.resignFirstResponder()

        return true
    }
    
    
    @IBAction func singupAction(_ sender: AnyObject) {
        
        guard let email = emailTextField.text, let password = passwordTextFied.text,
              let name = nameTextField.text, let repassword = repasswordTextFiled.text,
              let age = ageTextFiled.text, let birth = birthTextFiled.text
            , let tel = telTextFiled.text else {
            print("Form is not valid")
            return
        }
        if(repassword == password){
            if (email == "" || password == "" || repassword == "" || name == "" || age == "" || birth == "" || tel == "" ) {
                self.ShowAlert("กรุณากรอกข้อมูลให้ครบทุกช่อง",titleText: "Oops!")
            }
            else{
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
                        
                        if error != nil {
                            self.ShowAlert((error?.localizedDescription)!,titleText: "Oops!")
                            return
                        }
                        
                        guard let uid = user?.uid else {
                            return
                        }

                        let values = ["name": name, "email": email,"birth":birth,"age":age,"tel":tel]
                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                        self.performSegue(withIdentifier: "show", sender: self)
                    })
                }
            }
        else{
            self.ShowAlert("repassword incorrect password",titleText: "Worng!")
            self.passwordTextFied.text = ""
            self.repasswordTextFiled.text = ""
        }
    }
    
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = FIRDatabase.database().reference(fromURL: "https://insugar-59672.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
        })
    }
    
    func ShowAlert(_ text: String, titleText: String){
        let alert = UIAlertController(title: titleText,
                                      message: text,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            
        }
    }
    

}
