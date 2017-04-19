//
//  CalculatorController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/4/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit
import Firebase
import CoreData
class CalculatorController: UIViewController ,UITextFieldDelegate,UIPopoverPresentationControllerDelegate,UIPopoverControllerDelegate{
    @IBOutlet weak var mg: UITextField!
    @IBOutlet weak var food: UITextField!
    @IBOutlet weak var active: UITextField!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var tdd: UIButton!
    @IBOutlet weak var weight: UIButton!
    @IBOutlet weak var medbtn: UIButton!
    var mutiple1000 = 1500
    var weightmultiply = 0.0
    var medbtn2 = ""
    var carbohydrate = ""
    var result = ""
    var time = ""
    var tdd2 = Foundation.UserDefaults.standard
    var menulist = Foundation.UserDefaults.standard
    var unit = String()
    var textField = UITextField()
    var long = ""
    var unitlong = ""
    var sugar = ""
    var databasetdd = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mg.delegate = self
        self.food.delegate = self
        self.active.delegate = self
        self.total.delegate = self
        self.textField.delegate = self
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "hh:mm"
        result = formatter.string(from: date)
        time = formatter2.string(from: date)
        if(tdd2.object(forKey: "Date") as? String != result){
            tdd2.set(result, forKey: "Date")
            longunit()
        }else{
            if(tdd2.object(forKey: "long") as? String != ""){
                longunit()
            }
        }
        
        
        print(time)
        print(result)
        
        
       
        let fetchRequest: NSFetchRequest<Tdd> = Tdd.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                if(trans.value(forKey: "tdd") as! String != ""){
                    total.text  = trans.value(forKey: "tdd") as! String
                    databasetdd = trans.value(forKey: "tdd") as! String
                    print("\(trans.value(forKey: "tdd"))")
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        
        
        
        
        
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func longunit(){
        let alert = UIAlertController(title: "ยาชนิดออกฤทธิ์ยาว", message: "กรอกจำนวนยาที่ฉีด", preferredStyle:
            UIAlertControllerStyle.alert)
        alert.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "จำนวนยูนิต"
            textField.delegate = self
            self.textField = textField
//            print(textField.text)
        }
        alert.addAction(UIAlertAction(title: "Insulin glargine (Lantus)", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.long = "Insulin glargine (Lantus)"
            self.longAlert("Insulin glargine (Lantus)")
            self.unitlong = self.textField.text!
            self.tdd2.set(self.long, forKey: "long")
            self.tdd2.set(self.unitlong, forKey: "unitlong")
        }))
        alert.addAction(UIAlertAction(title: "Insulin detemir (Levemir)", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.long = "Insulin detemir (Levemir)"
            self.longAlert("Insulin detemir (Levemir)")
            self.unitlong = self.textField.text!
            self.tdd2.set(self.long, forKey: "long")
            self.tdd2.set(self.unitlong, forKey: "unitlong")
        }))
        alert.addAction(UIAlertAction(title: "Insulin degludec (tresiba)", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.long = "Insulin degludec (tresiba)"
            self.longAlert("Insulin degludec (tresiba)")
            self.unitlong = self.textField.text!
            self.tdd2.set(self.long, forKey: "long")
            self.tdd2.set(self.unitlong, forKey: "unitlong")
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    func longAlert(_ med:String){
        let alert = UIAlertController(title: "จำนวนยาที่ฉีด " + textField.text! + " ยูนิต", message: "ชนิดยา " + med , preferredStyle:
            UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
        
        }))
        
    self.present(alert, animated: true, completion:nil)
    }
    
    func textFieldHandler(textField: UITextField!)
    {
        if (textField) != nil {
            textField.placeholder = "จำนวนยูนิตที่ใช้"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if(menulist.object(forKey: "menu") != nil){
         print(menulist.object(forKey: "menu") as! [[String : String]])
         let v = menulist.object(forKey: "menu") as! [[String : String]]
         food.text =  menulist.object(forKey: "sugar") as! String
        }
//        if(menulist.object(forKey: "sugar") as! String != ""){
//            menulist.set("0", forKey: "sugar")
        
//        }

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(total.text != ""){
            mg.isUserInteractionEnabled = false
            //mg.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        }else{
              mg.isUserInteractionEnabled = true
              mg.backgroundColor = UIColor.white
        }
        if(mg.text != ""){
            total.isUserInteractionEnabled = false
            //mg.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        }else{
            total.isUserInteractionEnabled = true
            mg.backgroundColor = UIColor.white
        }
    }
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= 150
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += 150
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
          //self.carbohydrate = (menulist.object(forKey: "sugar") as! String?)!
          //food.text = self.carbohydrate
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.mg.resignFirstResponder()
        self.food.resignFirstResponder()
        self.active.resignFirstResponder()
        self.total.resignFirstResponder()

        return true
    }
    
    @IBAction func FoodBtnPress(_ sender: Any) {
        self.performSegue(withIdentifier: "show", sender: self)
    }

    @IBAction func ActiveBtnPress(_ sender: Any) {
        self.performSegue(withIdentifier: "show2", sender: self)
    }
    @IBAction func save(_ sender: Any) {
        if(databasetdd != total.text){
            let context = getContext()
            
            //retrieve the entity that we just created
            let entity =  NSEntityDescription.entity(forEntityName: "Tdd", in: context)
            
            let transc = NSManagedObject(entity: entity!, insertInto: context)
            
            //set the entity values
            transc.setValue(total.text, forKey: "tdd")
            
            
            //save the object
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
        }
        var tdd = 0.0
        if(total.text != ""){
            tdd = Double(self.total.text!)!
        }
        if(mg.text != ""){
            tdd = Double(self.mg.text!)!
            tdd *= weightmultiply
        }
        if(active.text == "" || food.text == "" || tdd2.object(forKey: "med") as? String == ""){
            
        }else{
            let med = self.medbtn2
            var unit = 0
            sugar = self.active.text!
            let active = Int(self.active.text!)
            let food = Double(self.food.text!)
            var r1 = 0
            print(ceil(0.44))
            if(mutiple1000 == 1500){
                r1 = accurateRound(1500.0/tdd)
            }
            if(mutiple1000 == 1800){
                r1 = accurateRound(1800.0/tdd)
            }
            print(r1)
            if(r1 >= active!){
                unit += 1
            }else{
                unit +=  Int(active!/r1)
            }
            print(unit)
            let k = accurateRound(500/tdd);
            print(Double(k))
            let f = Int((food)!/Double(k))
            unit +=  f
            print(f)
            print(unit)
            self.unit = String(unit)
            
            var dic = [[String:String]]()
            self.menulist.set(dic , forKey: "menu")
            self.menulist.set(dic , forKey: "active")
            self.menulist.set("" , forKey: "sugar")
            menulist.set("0", forKey: "sugar")
            self.mg.text = ""
            self.food.text = ""
            self.active.text = ""
            
            
            let alert = UIAlertController(title: "จำนวนยาที่ฉีด " + self.unit + " ยูนิต", message: "ชนิดยา " + med, preferredStyle:
                UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
                self.sendToFirebase(med)
            }))
            alert.addAction(UIAlertAction(title: "ยกเลิก", style: UIAlertActionStyle.cancel, handler:{ (UIAlertAction)in
                
            }))
            self.present(alert, animated: true, completion:nil)
            
            
        }
      
        

    }
    func accurateRound(_ value: Double) -> Int {
        
        var d : Double = value - Double(Int(value))
        if d < 0.5 {
            return Int(value)
        } else {
            return Int(value) + 1
        }
    }
    
    func sendToFirebase(_ med:String){
        let id = FIRAuth.auth()!.currentUser!.uid
        let ref = FIRDatabase.database().reference().child("carbohydrate")
        let childRef = ref.childByAutoId()
        let values = ["Id": id,"Short": med,"UnitShort": self.unit, "Date": result,"Time":time,"Long": self.long,"UnitLong":self.unitlong,"Sugar":self.sugar] as [String : Any]
        
        childRef.updateChildValues(values) { (error, ref) in
            if error != nil {
                print(error)
                return
            }
            
        }
        
        
        
        

        
        
    }
    func valuesChanged(_ changedValue: String) {
        //this will be called when popuviewcontroller call valueschanged on delegate object
        print(changedValue)
    }
    @IBAction func weigthPress(_ sender: Any) {

        let alert = UIAlertController(title: "0.2-2.0", message: "ตัวคูณน้ำหนัก", preferredStyle:
            UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "0.2", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.2", for: [])
            self.weightmultiply = 0.2
        }))
        alert.addAction(UIAlertAction(title: "0.3", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.3", for: [])
            self.weightmultiply = 0.3
        }))
        alert.addAction(UIAlertAction(title: "0.4", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.4", for: [])
            self.weightmultiply = 0.4
        }))
        alert.addAction(UIAlertAction(title: "0.5", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.5", for: [])
            self.weightmultiply = 0.5
        }))
        alert.addAction(UIAlertAction(title: "0.6", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.6", for: [])
            self.weightmultiply = 0.6

        }))
        alert.addAction(UIAlertAction(title: "0.7", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.7", for: [])
            self.weightmultiply = 0.7
        }))
        alert.addAction(UIAlertAction(title: "0.8", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.8", for: [])
            self.weightmultiply = 0.8
        }))
        alert.addAction(UIAlertAction(title: "0.9", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("0.9", for: [])
            self.weightmultiply = 0.9
        }))
        alert.addAction(UIAlertAction(title: "1.0", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.0", for: [])
            self.weightmultiply = 1.0
        }))
        alert.addAction(UIAlertAction(title: "1.1", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.1", for: [])
            self.weightmultiply = 1.1
        }))
        alert.addAction(UIAlertAction(title: "1.2", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.2", for: [])
            self.weightmultiply = 1.3
        }))
        alert.addAction(UIAlertAction(title: "1.3", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.3", for: [])
            self.weightmultiply = 1.3
        }))
        alert.addAction(UIAlertAction(title: "1.4", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.4", for: [])
            self.weightmultiply = 1.4
        }))
        alert.addAction(UIAlertAction(title: "1.5", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.5", for: [])
            self.weightmultiply = 1.5
        }))
        alert.addAction(UIAlertAction(title: "1.6", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.6", for: [])
            self.weightmultiply = 1.6
        }))
        alert.addAction(UIAlertAction(title: "1.7", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.7", for: [])
            self.weightmultiply = 1.7
        }))
        alert.addAction(UIAlertAction(title: "1.8", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.8", for: [])
            self.weightmultiply = 1.8
        }))
        alert.addAction(UIAlertAction(title: "1.9", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("1.9", for: [])
            self.weightmultiply = 1.9
        }))
        alert.addAction(UIAlertAction(title: "2.0", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.weight.setTitle("2.0", for: [])
            self.weightmultiply = 2.0
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
    @IBAction func TDD(_ sender: Any) {
        
        let alert = UIAlertController(title: "เลือกยา", message: "เลือกยาที่คุณจะฉีด", preferredStyle:
            UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: " ❶ Rapid Insulin", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
           
        }))
        alert.addAction(UIAlertAction(title: "Insulin Lispro (Humalog)", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Insulin Lispro (Humalog)", for: [])
            self.medbtn2 = "Insulin Lispro (Humalog)"
            self.mutiple1000 = 1800
        }))
        alert.addAction(UIAlertAction(title: "Insulin aspart (NovoRapid)", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Insulin aspart (NovoRapid)", for: [])
            self.medbtn2 = "Insulin aspart (NovoRapid)"
            self.mutiple1000 = 1800
        }))
        alert.addAction(UIAlertAction(title: "Insulin Glulisine (Aprida)", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Insulin Glulisine (Aprida)", for: [])
            self.medbtn2 = "Insulin Glulisine (Aprida)"
            self.mutiple1000 = 1800
        }))
        alert.addAction(UIAlertAction(title: " ❷ Short Insulin", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
         
        }))
        alert.addAction(UIAlertAction(title: "Actrapid Hm", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Actrapid Hm", for: [])
            self.medbtn2 = "Actrapid Hm"
            self.mutiple1000 = 1500
        }))
        alert.addAction(UIAlertAction(title: "Humulin R", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Humulin R", for: [])
            self.medbtn2 = "Humulin R"
            self.mutiple1000 = 1500
        }))
        alert.addAction(UIAlertAction(title: "Gensulin R", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Gensulin R", for: [])
            self.medbtn2 = "Gensulin R"
            self.mutiple1000 = 1500
        }))
        alert.addAction(UIAlertAction(title: "Insugen R", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Insugen R", for: [])
            self.medbtn2 = "Insugen R"
            self.mutiple1000 = 1500
        }))
        alert.addAction(UIAlertAction(title: "Insuman Rapid", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.medbtn.setTitle("Insuman Rapid", for: [])
            self.medbtn2 = "Insuman Rapid"
            self.mutiple1000 = 1500
        }))
         self.present(alert, animated: true, completion:nil)
    }
    
    
    
    @IBOutlet weak var ac: UIButton!
    
    @IBAction func activePress(_ sender: Any) {
        self.performSegue(withIdentifier: "show2", sender: self)
//        let alert = UIAlertController(title: "กิจกรรม", message: "เลือกกิจกรรมที่คุณทำวันนี้", preferredStyle:
//            UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "ว่ายน้ำ", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
//            self.ac.setTitle("ว่ายน้ำ", for: [])
//        }))
//        alert.addAction(UIAlertAction(title: "แบดมินตัน", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
//            self.ac.setTitle("แบดมินตัน", for: [])
//        }))
//        self.present(alert, animated: true, completion:nil)
        
    }
    
    func fillTextview(filledData: IndexPath) {
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "show" {
            if let AllMenuController: AllMenuController = segue.destination as? AllMenuController {
                AllMenuController.type = "food"
            }
        } else if segue.identifier == "show2" {
            if let AllMenuController: AllMenuController = segue.destination as? AllMenuController {
                AllMenuController.type = "active"
            }
        }
    }

}
