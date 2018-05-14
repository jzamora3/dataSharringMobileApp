//
//  LoginViewController.swift
//  DataBankBeta
//
//  Created by A on 5/2/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    @IBAction func btnPasswordGenerator(_ sender: UIButton) {
        
        var len = 8
        let pswdChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
        let randomPswd = String((0..<len).map{ _ in pswdChars[Int(arc4random_uniform(UInt32(pswdChars.count)))]})
        passwordLbl.text! = randomPswd
    }
    
    @IBOutlet weak var usernameLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBAction func signUpButton(_ sender: Any) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://jzamora4.create.stedwards.edu/iOSDB/insert.php")! as URL)
        
        request.httpMethod = "POST"
        
        let postString = "a=\(usernameLbl.text!)&b=\(passwordLbl.text!)&c=\(fullName.text!)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){data, response, error in
            
            if error != nil{
                print("error=\(response!)")
                
                
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            
            DispatchQueue.main.async() {
                if (responseString! == "Success"){
                    let alertController = UIAlertController(title: "New Account", message: "successfully Added", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Cannot Create New Account", message: "Username already exists", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                self.usernameLbl.text = ""
                self.passwordLbl.text = ""
                self.fullName.text = ""
            }
        }
        task.resume()
    }


    
    
}

