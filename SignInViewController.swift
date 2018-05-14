//
//  SignInViewController.swift
//  DataBankBeta
//
//  Created by A on 5/2/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var values : NSArray = []
    @IBAction func password(_ sender: Any) {
        
        //let name = getData()
        let request = NSMutableURLRequest(url: NSURL(string: "https://jzamora4.create.stedwards.edu/iOSDB/selectUser.php")! as URL)
        
        request.httpMethod = "POST"
        let postString = "a=\(username.text!)&b=\(password.text!)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error  in
            
            if error != nil {
                
                print ("error=\(error!)")
                return
            }
            print("response = \(response!)")
            
            
            
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            
            
            
            DispatchQueue.main.async() {
                
                if (responseString! == "Success"){
                    let alertController = UIAlertController(title: "Login Successful", message: "Welcome \(self.username.text!) ", preferredStyle: UIAlertControllerStyle.alert)
                    
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action -> Void in
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                }
                else{
                    let alertController = UIAlertController(title: "Login Failed", message: "Incorrect username or password", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                } //end of else
                self.username.text = ""
                self.password.text = ""
                
                
                
            } // end of dispatch
            
            
            
        }// end of task
        
        task.resume()
        
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    /*func getData(){
        
        let url = NSURL(string: "https://jzamora4.create.stedwards.edu/iOSDB/selectUser.php")
        let data = NSData(contentsOf: url! as URL)
        
        values = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
    }*/
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
