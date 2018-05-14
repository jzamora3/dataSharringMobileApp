//
//  coreToArray.swift
//  DataBankBeta
//
//  Created by A on 5/3/18.
//  Copyright © 2018 A. All rights reserved.
//
import Foundation
import CoreData

class coreToArray{
    
    //Checks for duplicate test names and return bool
    static func validateTest(testName : String)->Bool{
        var testArray = [Question]()
        var duplicateName = false
        do  {
            testArray = try context.fetch(Question.fetchRequest())
            
            for eachName in testArray{
                if testName == eachName.testName!{
                    duplicateName = true
                    
                }
            }
            
        }
            
        catch {}
        return duplicateName
    }
    
    //Creates the array for individual tests, all questions and answers will be displayed as such [question, answer1, answer2, answer3, answer4]
    static func testToArray(testName : String) -> [[String]]{
        
        var questionArray = [[String]]()
        var tempArray = [Question]()
        do  {
            tempArray = try context.fetch(Question.fetchRequest())
            
            for eachItem in tempArray{
                if testName == eachItem.testName!{
                    questionArray.append([eachItem.testName!,eachItem.question!, eachItem.a1!, eachItem.a2!, eachItem.a3!, eachItem.a4!])
                }
            }
        }
        catch {}
        return questionArray
    }
    
    static func testNames()-> [String]{
        
        var namesArray = [String]()
        var tempArray = [Question]()
        do  {
            tempArray = try context.fetch(Question.fetchRequest())
            
            //This array removed duplicates from questionArray
            for eachName in tempArray{
                if namesArray.contains(eachName.testName!) == false{
                    namesArray.append(eachName.testName!)
                }
            }
            
        }
        catch {}
        return namesArray
        
    }
    
    static func testAnswers(testName : String) -> [[String]]{
        
        var questionArray = [[String]]()
        var tempArray = [Question]()
        do  {
            tempArray = try context.fetch(Question.fetchRequest())
            
            for eachItem in tempArray{
                if testName == eachItem.testName!{
                    questionArray.append([eachItem.a1!, eachItem.a2!, eachItem.a3!, eachItem.a4!])
                }
            }
        }
        catch {}
        return questionArray
    }
    static func testQuestions(testName : String) -> [[String]]{
        
        var questionArray = [[String]]()
        var tempArray = [Question]()
        do  {
            tempArray = try context.fetch(Question.fetchRequest())
            
            for eachItem in tempArray{
                if testName == eachItem.testName!{
                    questionArray.append([eachItem.question!])
                }
            }
        }
        catch {}
        return questionArray
    }
}
