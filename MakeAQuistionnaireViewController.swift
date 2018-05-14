//
//  MakeAQuistionnaireViewController.swift
//  DataBankBeta
//
//  Created by A on 5/3/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

class MakeAQuistionnaireViewController: UIViewController {

    @IBOutlet weak var txtTestName: UITextField!
    @IBOutlet weak var txtQuestion: UITextField!
    @IBOutlet weak var txtA1: UITextField!
    @IBOutlet weak var txtA2: UITextField!
    @IBOutlet weak var txtA3: UITextField!
    @IBOutlet weak var txtA4: UITextField!
    @IBOutlet weak var btnSubmitTest2: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func txtTestNameEditing(_ sender: UITextField) {
        
        //Checks live for duplicate test names, so user cannot create duplicate test
        if coreToArray.validateTest(testName: txtTestName.text!){
            popUpMessage(title: "Questionnaire \(txtTestName.text!) error", message: "That questionnaire already exist")
            txtTestName.text! = ""
        }
    }
    
    @IBAction func btnAddQuestion(_ sender: UIButton) {
        //Hide back button until they finnish submitting test
        
        if (txtTestName.text?.isEmpty)! || (txtQuestion.text?.isEmpty)! || (txtA1.text?.isEmpty)! || (txtA2.text?.isEmpty)! || (txtA3.text?.isEmpty)! || (txtA4.text?.isEmpty)!{
            self.popUpMessage(title: "Caution!", message: "Please fill out all fields")
        }
            
        else{
            //Disabled user from changing txtTestName
            txtTestName.isUserInteractionEnabled = false
            
            addQuestion()
            
            //Show submit button
            btnBack.isHidden = true
            btnSubmitTest2.isHidden = false
        }
    }
    
    @IBAction func btnSubmitTest(_ sender: UIButton) {
        
        if (txtTestName.text?.isEmpty)! || (txtQuestion.text?.isEmpty)! || (txtA1.text?.isEmpty)! || (txtA2.text?.isEmpty)! || (txtA3.text?.isEmpty)! || (txtA4.text?.isEmpty)!{
            self.popUpMessage(title: "Caution!", message: "Please fill out all fields")
        }
            
        else{
            submitTest()
            //Show button to user after submit test
            btnBack.isHidden = false
            
            //Enabled user from changing txtTestName
            txtTestName.isUserInteractionEnabled = true
            btnSubmitTest2.isHidden = true
            
            for items in testNames{
                print(coreToArray.testQuestions(testName: items))
                print(coreToArray.testAnswers(testName: items))
            }
            
            
        }
        
        popUpMessage(title: "New Questionnaire", message: "Your questions have been added")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnSubmitTest2.isHidden = true
        popUpMessage(title: "Make A Questionnaire", message: "After your last question hit Finished button")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addQuestion(){
        let newTest = Question(context: context)
        
        //Assign values to coredata
        newTest.testName = txtTestName.text!
        newTest.question = txtQuestion.text!
        newTest.a1 = txtA1.text!
        newTest.a2 = txtA2.text!
        newTest.a3 = txtA3.text!
        newTest.a4 = txtA4.text!
        
        appDelegate.saveContext()
        
        //Clear question & answers to allow user to create values
        txtQuestion.text! = ""
        txtA1.text! = ""
        txtA2.text! = ""
        txtA3.text! = ""
        txtA4.text! = ""
    }
    
    func submitTest(){
        
        let newTest = Question(context: context)
        
        //Assign values to coredata
        newTest.testName = txtTestName.text!
        newTest.question = txtQuestion.text!
        newTest.a1 = txtA1.text!
        newTest.a2 = txtA2.text!
        newTest.a3 = txtA3.text!
        newTest.a4 = txtA4.text!
        
        appDelegate.saveContext()
        
        //Clear all textfields to prepare to create a new test
        txtTestName.text! = ""
        txtQuestion.text! = ""
        txtA1.text! = ""
        txtA2.text! = ""
        txtA3.text! = ""
        txtA4.text! = ""
    }
    
    func popUpMessage(title : String, message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
}
