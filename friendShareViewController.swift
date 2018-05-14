//
//  friendShareViewController.swift
//  DataBankBeta
//
//  Created by A on 5/3/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

class friendShareViewController: UIViewController {
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    var websiteString = ""
    @IBOutlet weak var websiteText: UITextField!
    

    
        @IBAction func websiteShareBtn(_ sender: Any) {
            
            websiteString = String(describing: websiteText.text)
            let activityVC = UIActivityViewController(activityItems: ["websiteString"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            self.present(activityVC, animated: true, completion: nil)
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

