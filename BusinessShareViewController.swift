//
//  BusinessShareViewController.swift
//  DataBankBeta
//
//  Created by A on 5/2/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

class BusinessShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var webText = ""
    @IBOutlet weak var websiteText: UITextField!
    

    
    @IBAction func personalWebsite(_ sender: Any) {
        
        webText = websiteText.text!
        
        
        //let myUrl = URL(string: "https://\(webText)")
        let URL : NSURL = NSURL(string: "https://\(webText)")!
        
        
        
        let activityVC = UIActivityViewController(activityItems: [URL], applicationActivities: [])
        activityVC.popoverPresentationController?.sourceView = self.view
       
        
        self.present(activityVC, animated: true, completion: nil)
    }
    

    
    
    @IBAction func businessCard(_ sender: Any) {
        
        if (BusinessCard != nil){
        let activityVC = UIActivityViewController(activityItems: [BusinessCard!], applicationActivities: [])
            activityVC.popoverPresentationController?.sourceView = self.view
            
            
            self.present(activityVC, animated: true, completion: nil)
    }
        else{
                        popUpMessage(title: "No Business Card Created", message: "Please create a business card!")
            
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
    func popUpMessage(title : String, message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
}
