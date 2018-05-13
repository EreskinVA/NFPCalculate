//
//  ResultHystory.swift
//  NFPCalculate
//
//  Created by EVladimirA on 13.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import Foundation
import Firebase

struct ResultHystory {
    let date: String
    let level: String
    let totalPoint: Int
    let totalRating: Int
    
    let age: Int
    let gender: String
    let workout: Int
    let category: Int
    let status: String

    let forceUpr: String
    let speedUpr: String
    let enduranceUpr: String
    let militarySkillsUpr: String
    let adilityUpr: String
    
    let forceResult: Int
    let speedResult: Int
    let enduranceResult: Int
    let militarySkillsResult: Int
    let adilityResult: Int
    
    let forceTotal: Int
    let speedTotal: Int
    let enduranceTotal: Int
    let militarySkillsTotal: Int
    let adilityTotal: Int
    
    let userId: String
    let ref: DatabaseReference?
 //   var completed: Bool = false
    
    init(date: String, level: String, totalPoint: Int, totalRating: Int, age: Int, gender: String, workout: Int, category: Int, status: String, forceUpr: String, speedUpr: String, enduranceUpr: String, militarySkillsUpr: String, adilityUpr: String, forceResult: Int, speedResult: Int, enduranceResult: Int, militarySkillsResult: Int, adilityResult: Int, forceTotal: Int, speedTotal: Int, enduranceTotal: Int, militarySkillsTotal: Int, adilityTotal: Int, userId: String) {
        
        self.date = date
        self.level = level
        self.totalPoint = totalPoint
        self.totalRating = totalRating
        
        self.age = age
        self.gender = gender
        self.workout = workout
        self.category = category
        self.status = status
        
        self.forceUpr = forceUpr
        self.speedUpr = speedUpr
        self.enduranceUpr = enduranceUpr
        self.militarySkillsUpr = militarySkillsUpr
        self.adilityUpr = adilityUpr
        
        self.forceResult = forceResult
        self.speedResult = speedResult
        self.enduranceResult = enduranceResult
        self.militarySkillsResult = militarySkillsResult
        self.adilityResult = adilityResult
        
        self.forceTotal = forceTotal
        self.speedTotal = speedTotal
        self.enduranceTotal = enduranceTotal
        self.militarySkillsTotal = militarySkillsTotal
        self.adilityTotal = adilityTotal
        
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        date = snapshotValue["date"] as! String
        level = snapshotValue["level"] as! String
        totalPoint = snapshotValue["totalPoint"] as! Int
        totalRating = snapshotValue["totalRating"] as! Int
        
        age = snapshotValue["age"] as! Int
        gender = snapshotValue["gender"] as! String
        workout = snapshotValue["workout"] as! Int
        category = snapshotValue["category"] as! Int
        status = snapshotValue["status"] as! String
        
        forceUpr = snapshotValue["forceUpr"] as! String
        speedUpr = snapshotValue["speedUpr"] as! String
        enduranceUpr = snapshotValue["enduranceUpr"] as! String
        militarySkillsUpr = snapshotValue["militarySkillsUpr"] as! String
        adilityUpr = snapshotValue["adilityUpr"] as! String
        
        forceResult = snapshotValue["forceResult"] as! Int
        speedResult = snapshotValue["speedResult"] as! Int
        enduranceResult = snapshotValue["enduranceResult"] as! Int
        militarySkillsResult = snapshotValue["militarySkillsResult"] as! Int
        adilityResult = snapshotValue["adilityResult"] as! Int
        
        forceTotal = snapshotValue["forceTotal"] as! Int
        speedTotal = snapshotValue["speedTotal"] as! Int
        enduranceTotal = snapshotValue["enduranceTotal"] as! Int
        militarySkillsTotal = snapshotValue["militarySkillsTotal"] as! Int
        adilityTotal = snapshotValue["adilityTotal"] as! Int
        
        userId = snapshotValue["userId"] as! String
        ref = snapshot.ref
    
    }
    
    func convertToDictionary() -> Any {
        return ["date": date, "level": level, "totalPoint": totalPoint, "totalRating": totalRating, "age": age, "gender": gender, "workout": workout, "category": category, "status": status, "forceUpr": forceUpr, "speedUpr": speedUpr, "enduranceUpr": enduranceUpr, "militarySkillsUpr": militarySkillsUpr, "adilityUpr": adilityUpr, "forceResult": forceResult, "speedResult": speedResult, "enduranceResult": enduranceResult, "militarySkillsResult": militarySkillsResult, "adilityResult": adilityResult, "forceTotal": forceTotal, "speedTotal": speedTotal, "enduranceTotal": enduranceTotal, "militarySkillsTotal": militarySkillsTotal, "adilityTotal": adilityTotal, "userId": userId]
    }
}
