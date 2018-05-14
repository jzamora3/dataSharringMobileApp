//
//  takeATestViewController.swift
//  DataBankBeta
//
//  Created by A on 5/3/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit


var questionsArray = [[String]]()
var answersArray = [[String]]()

class takeATestViewController: UIViewController {
    
    var rightAnswerPlacement:UInt32 = 0
    var currentQuestion = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsArray.append(contentsOf: coreToArray.testQuestions(testName: testNames[chosenIndex]))
        answersArray.append(contentsOf: coreToArray.testAnswers(testName: testNames[chosenIndex]))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var testQuestionLbl: UILabel!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBAction func action(_ sender: AnyObject) {
        
        if (sender.tag == Int(rightAnswerPlacement)){
            
            
        }
            
        else{
            
        }
        
        if currentQuestion != questionsArray.count{
            newQuestion()
        }
        else{
           
            popUpMessage(title: "Questionnaire is over", message: "We appreciate your input your information is valuable")
            lblTestName.text! = "Thank you!"
            questionsArray.removeAll()
            answersArray.removeAll()
            testQuestionLbl.text! = ""
            btnA.isHidden = true
            btnB.isHidden = true
            btnC.isHidden = true
            btnD.isHidden = true
            btnBack.isHidden = false
            
        }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
        btnBack.isHidden = true
    }
    
    
    @IBOutlet weak var lblTestName: UILabel!
    //New question display
    func newQuestion(){
        
        lblTestName.text! = testNames[chosenIndex]
        testQuestionLbl.text! = questionsArray[currentQuestion][0]
        rightAnswerPlacement = arc4random_uniform(4)+1
        var button:UIButton = UIButton()
        var x = 1
        for i in 1...4{
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement)){
                button.setTitle(answersArray[currentQuestion][0], for: .normal)
            }
            else{
                button.setTitle(answersArray[currentQuestion][x], for: .normal)
                x += 1
            }
        }
        currentQuestion += 1
    }
    
    func popUpMessage(title : String, message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
}

