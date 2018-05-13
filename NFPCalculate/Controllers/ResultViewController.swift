//
//  ResultViewController.swift
//  NFPCalculate
//
//  Created by EVladimirA on 02.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import UIKit
import Firebase

class ResultViewController: UIViewController {

    var user: UserC!
    var ref: DatabaseReference!
    var parametrsDict = [String: String]()
    
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var totalRating: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var forceUpr: UILabel!
    @IBOutlet weak var speedUpr: UILabel!
    @IBOutlet weak var enduranceUpr: UILabel!
    @IBOutlet weak var militarySkillsUpr: UILabel!
    @IBOutlet weak var adilityUpr: UILabel!
    
    @IBOutlet weak var forceResult: UILabel!
    @IBOutlet weak var speedResult: UILabel!
    @IBOutlet weak var enduranceResult: UILabel!
    @IBOutlet weak var militarySkillsResult: UILabel!
    @IBOutlet weak var adilityResult: UILabel!
    
    @IBOutlet weak var forceTotal: UILabel!
    @IBOutlet weak var speedTotal: UILabel!
    @IBOutlet weak var enduranceTotal: UILabel!
    @IBOutlet weak var militarySkillsTotal: UILabel!
    @IBOutlet weak var adilityTotal: UILabel!
    
    @IBOutlet weak var militarySkillsStack: UIStackView!
    @IBOutlet weak var adilityStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentUser = Auth.auth().currentUser else { return }
        user = UserC(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("date")
        
        resultView.clipsToBounds = true
        resultView.layer.cornerRadius = 15
        resultView.layer.masksToBounds = true
        
        forceUpr.text = parametrsDict["forceUpr"]
        speedUpr.text = parametrsDict["speedUpr"]
        enduranceUpr.text = parametrsDict["enduranceUpr"]
        militarySkillsUpr.text = parametrsDict["militarySkillsUpr"]
        adilityUpr.text = parametrsDict["adilityUpr"]
            
        forceResult.text = parametrsDict["forceResult"]
        speedResult.text = parametrsDict["speedResult"]
        enduranceResult.text = parametrsDict["enduranceResult"]
        militarySkillsResult.text = parametrsDict["militarySkillsResult"]
        adilityResult.text = parametrsDict["adilityResult"]
        
        if parametrsDict["workout"] == "3" {
            totalPoints.text = String(Int(forceResult.text!)!+Int(speedResult.text!)!+Int(enduranceResult.text!)!)
        } else if parametrsDict["workout"] == "4" {
            totalPoints.text = String(Int(forceResult.text!)!+Int(speedResult.text!)!+Int(enduranceResult.text!)!+Int(militarySkillsResult.text!)!)
        } else {
            totalPoints.text = String(Int(forceResult.text!)!+Int(speedResult.text!)!+Int(enduranceResult.text!)!+Int(militarySkillsResult.text!)!+Int(adilityResult.text!)!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if parametrsDict["workout"] == "3" {
            militarySkillsStack.isHidden = true
            adilityStack.isHidden = true
        } else if parametrsDict["workout"] == "4" {
            adilityStack.isHidden = true
        } else {
            militarySkillsStack.isHidden = false
            adilityStack.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressSave(_ sender: UIBarButtonItem) {
    
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        let someDateTime = "130520182321"//formatter.string(from: date)
        
        
        print(someDateTime)
        print(levelLabel.text!)
        print(Int(totalPoints.text!)!)
        print(Int(totalRating.text!)!)
        print(Int(parametrsDict["age"]!)!)
        print(parametrsDict["gender"]!)
        print(Int(parametrsDict["workout"]!)!)
        print(Int(parametrsDict["category"]!)!)
        print(parametrsDict["status"]!)
        print(forceUpr.text!)
        print(speedUpr.text!)
        print(enduranceUpr.text!)
        print(militarySkillsUpr.text!)
        print(adilityUpr.text!)
        print(Int(forceResult.text!)!)
        print(Int(speedResult.text!)!)
        print(Int(enduranceResult.text!)!)
        print(Int(militarySkillsResult.text!)!)
        print(Int(adilityResult.text!)!)
        print(Int(forceTotal.text!)!)
        print(Int(speedTotal.text!)!)
        print(Int(enduranceTotal.text!)!)
        print(Int(militarySkillsTotal.text!)!)
        print(Int(adilityTotal.text!)!)
        print(self.user.uid)
        
        let history = ResultHystory(date: someDateTime, level: levelLabel.text!, totalPoint: Int(totalPoints.text!)!, totalRating: Int(totalRating.text!)!, age: Int(parametrsDict["age"]!)!, gender: parametrsDict["gender"]!, workout: Int(parametrsDict["workout"]!)!, category: Int(parametrsDict["category"]!)!, status: parametrsDict["status"]!, forceUpr: forceUpr.text!, speedUpr: speedUpr.text!, enduranceUpr: enduranceUpr.text!, militarySkillsUpr: militarySkillsUpr.text!, adilityUpr: adilityUpr.text!, forceResult: Int(forceResult.text!)!, speedResult: Int(speedResult.text!)!, enduranceResult: Int(enduranceResult.text!)!, militarySkillsResult: Int(militarySkillsResult.text!)!, adilityResult: Int(adilityResult.text!)!, forceTotal: Int(forceTotal.text!)!, speedTotal: Int(speedTotal.text!)!, enduranceTotal: Int(enduranceTotal.text!)!, militarySkillsTotal: Int(militarySkillsTotal.text!)!, adilityTotal: Int(adilityTotal.text!)!, userId: (self.user.uid))
        //let task = ResultHystory(date: textField.text!, userId: (self?.user.uid)!)
        let taskRef = self.ref.child(history.date)
        taskRef.setValue(history.convertToDictionary())
        
    }
    
}


