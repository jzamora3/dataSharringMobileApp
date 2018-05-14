//
//  BusinessCardViewController.swift
//  DataBankBeta
//
//  Created by A on 5/2/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

var BusinessCard:UIImage? = nil

class BusinessCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var viewMePlz: UIView!
    
    
    @IBOutlet weak var lblCompany: UILabel!
    
    
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblWebsite: UILabel!
    
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var companyText: UITextField!
    
    @IBOutlet weak var addressText: UITextField!
    @IBAction func createBtn(_ sender: Any) {
        
        lblCompany.text = companyText.text
        lblName.text = nameText.text
        lblEmail.text = emailText.text
        lblTitle.text = titleText.text
        lblAddress.text = addressText.text
        lblWebsite.text = website.text
        lblContact.text = contactText.text
        
        
        
        
        BusinessCard = viewMePlz.asImage()
        

    }
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var contactText: UITextField!
    
    @IBOutlet weak var website: UITextField!
    
    @IBOutlet weak var businessCardBackground: UIImageView!
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
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
extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
