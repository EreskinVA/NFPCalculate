//
//  ResultViewController.swift
//  NFPCalculate
//
//  Created by EVladimirA on 02.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

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
    
    }
    
}


