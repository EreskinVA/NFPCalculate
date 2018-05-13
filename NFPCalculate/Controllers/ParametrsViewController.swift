//
//  ParametrsViewController.swift
//  NFPCalculate
//
//  Created by EVladimirA on 02.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import UIKit

class ParametrsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var parametrsDict = [String: String]()
    
    @IBOutlet weak var forceTF: UITextField!
    @IBOutlet weak var speedTF: UITextField!
    @IBOutlet weak var enduranceTF: UITextField!
    @IBOutlet weak var militarySkillsTF: UITextField!
    @IBOutlet weak var adilityTF: UITextField!
    
    @IBOutlet weak var forceResultTF: UITextField!
    @IBOutlet weak var speedResultTF: UITextField!
    @IBOutlet weak var enduranceResultTF: UITextField!
    @IBOutlet weak var militarySkillsResultTF: UITextField!
    @IBOutlet weak var adilityResultTF: UITextField!
    
    @IBOutlet weak var militarySkillsStack: UIStackView!
    @IBOutlet weak var adilityStack: UIStackView!
    
    var forcePV = UIPickerView()
    var speedPV = UIPickerView()
    var endurancePV = UIPickerView()
    var militarySkillsPV = UIPickerView()
    var adilityPV = UIPickerView()
    
    var forceResultPV = UIPickerView()
    var speedResultPV = UIPickerView()
    var enduranceResultPV = UIPickerView()
    var militarySkillsResultPV = UIPickerView()
    var adilityResultPV = UIPickerView()
    
    var arrayForcePV: Array = [String]()
    var arraySpeedPV: Array = [String]()
    var arrayEndurancePV: Array = [String]()
    var arrayMilitarySkillsPV: Array = [String]()
    var arrayAdilityPV: Array = [String]()
    
    var arrayForceResultPV: Array = [String]()
    var arraySpeedResultPV: Array = [String]()
    var arrayEnduranceResultPV: Array = [String]()
    var arrayMilitarySkillsResultPV: Array = [String]()
    var arrayAdilityResultPV: Array = [String]()
    
    // var resultArrayPV: Array = [String]()
    
    let segueIdentyfire = "resultSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // установка PickerView
        
        forcePV.delegate = self
        forcePV.dataSource = self
        
        speedPV.delegate = self
        speedPV.dataSource = self
        
        endurancePV.delegate = self
        endurancePV.dataSource = self
        
        militarySkillsPV.delegate = self
        militarySkillsPV.dataSource = self
        
        adilityPV.delegate = self
        adilityPV.dataSource = self
        
        forceResultPV.delegate = self
        forceResultPV.dataSource = self
        
        speedResultPV.delegate = self
        speedResultPV.dataSource = self
        
        enduranceResultPV.delegate = self
        enduranceResultPV.dataSource = self
        
        militarySkillsResultPV.delegate = self
        militarySkillsResultPV.dataSource = self
        
        adilityResultPV.delegate = self
        adilityResultPV.dataSource = self
        
        forcePV.tag = 0
        speedPV.tag = 1
        endurancePV.tag = 2
        militarySkillsPV.tag = 3
        adilityPV.tag = 4
        
        forceResultPV.tag = 5
        speedResultPV.tag = 6
        enduranceResultPV.tag = 7
        militarySkillsResultPV.tag = 8
        adilityResultPV.tag = 9
        
        forceTF.inputView = forcePV
        speedTF.inputView = speedPV
        enduranceTF.inputView = endurancePV
        militarySkillsTF.inputView = militarySkillsPV
        adilityTF.inputView = adilityPV
        
        forceResultTF.inputView = forceResultPV
        speedResultTF.inputView = speedResultPV
        enduranceResultTF.inputView = enduranceResultPV
        militarySkillsResultTF.inputView = militarySkillsResultPV
        adilityResultTF.inputView = adilityResultPV
        
        forceTF.textAlignment = .center
        speedTF.textAlignment = .center
        enduranceTF.textAlignment = .center
        militarySkillsTF.textAlignment = .center
        adilityTF.textAlignment = .center
        
        forceResultTF.textAlignment = .center
        speedResultTF.textAlignment = .center
        enduranceResultTF.textAlignment = .center
        militarySkillsResultTF.textAlignment = .center
        adilityResultTF.textAlignment = .center
        
        addButtonPickerView()
        
        // заполнение полей по умолчанию
        
        inputArray()
        forceTF.text = arrayForcePV[0]
        speedTF.text = arraySpeedPV[0]
        enduranceTF.text = arrayEndurancePV[0]
        militarySkillsTF.text = arrayMilitarySkillsPV[0]
        adilityTF.text = arrayAdilityPV[0]
        
        inputArrayResult()
        forceResultTF.text = arrayForceResultPV[0]
        speedResultTF.text = arraySpeedResultPV[0]
        enduranceResultTF.text = arrayEnduranceResultPV[0]
        militarySkillsResultTF.text = arrayMilitarySkillsResultPV[0]
        adilityResultTF.text = arrayAdilityResultPV[0]
        
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
    
    
    func inputArray() {
        var arrays: Category
        
        if parametrsDict["gender"] == "Муж." {
            arrays = CategogyParametrsViewMan()
        } else {
            arrays = CategogyParametrsViewWoman()
        }
        
        arrayForcePV.removeAll()
        arraySpeedPV.removeAll()
        arrayEndurancePV.removeAll()
        arrayMilitarySkillsPV.removeAll()
        arrayAdilityPV.removeAll()
        
        for item in arrays.force {
            arrayForcePV.append("\(item.value) (Упр. №\(item.key))")
        }
        arrayForcePV = arrayForcePV.sorted()
        
        for item in arrays.speed {
            arraySpeedPV.append("\(item.value) (Упр. №\(item.key))")
        }
        arraySpeedPV = arraySpeedPV.sorted()
        
        for item in arrays.endurance {
            arrayEndurancePV.append("\(item.value) (Упр. №\(item.key))")
        }
        arrayEndurancePV = arrayEndurancePV.sorted()
        
        for item in arrays.militarySkills {
            arrayMilitarySkillsPV.append("\(item.value) (Упр. №\(item.key))")
        }
        arrayMilitarySkillsPV = arrayMilitarySkillsPV.sorted()
        
        for item in arrays.adility {
            arrayAdilityPV.append("\(item.value) (Упр. №\(item.key))")
        }
        arrayAdilityPV = arrayAdilityPV.sorted()
        
    }
    
    func inputArrayResult() {
        arrayForceResultPV.removeAll()
        arraySpeedResultPV.removeAll()
        arrayEnduranceResultPV.removeAll()
        arrayMilitarySkillsResultPV.removeAll()
        arrayAdilityResultPV.removeAll()
        
        let resultAmountPoints = ResultAmountPoints()
        resultAmountPoints.amountPoints
        
        let keyForce = keyNumberInString(stroka: forceTF.text!)
        let keySpeed = keyNumberInString(stroka: arraySpeedPV[0])
        let keyEndurance = keyNumberInString(stroka: arrayEndurancePV[0])
        let keyMilitarySkills = keyNumberInString(stroka: arrayMilitarySkillsPV[0])
        let keyAdility = keyNumberInString(stroka: arrayAdilityPV[0])
        
        arrayForceResultPV = keysInArray(dict: resultAmountPoints.amountPoints[keyForce]!)
        arraySpeedResultPV = keysInArray(dict: resultAmountPoints.amountPoints[keySpeed]!)
        arrayEnduranceResultPV = keysInArray(dict: resultAmountPoints.amountPoints[keyEndurance]!)
        arrayMilitarySkillsResultPV = keysInArray(dict: resultAmountPoints.amountPoints[keyMilitarySkills]!)
        arrayAdilityResultPV = keysInArray(dict: resultAmountPoints.amountPoints[keyAdility]!)
        
        print(arrayForceResultPV)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return arrayForcePV.count
        case 1:
            return arraySpeedPV.count
        case 2:
            return arrayEndurancePV.count
        case 3:
            return arrayMilitarySkillsPV.count
        case 4:
            return arrayAdilityPV.count
        case 5:
            return arrayForceResultPV.count
        case 6:
            return arraySpeedResultPV.count
        case 7:
            return arrayEnduranceResultPV.count
        case 8:
            return arrayMilitarySkillsResultPV.count
        case 9:
            return arrayAdilityResultPV.count
        default:
            return 0
        }
    }
    
    func keyNumberInString(stroka: String) -> String {
        var startIndex = stroka.index(of: "№")!
        startIndex = stroka.index(startIndex, offsetBy: 1)
        let endIndex = stroka.index(of: ")")!
        return String(stroka[startIndex..<endIndex])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0 {
            forceTF.text = arrayForcePV[row]
            inputArrayResult()
            forceResultTF.text = arrayForceResultPV[0]
            //forceTF.resignFirstResponder()
        } else if pickerView.tag == 1 {
            speedTF.text = arraySpeedPV[row]
            inputArrayResult()
            speedResultTF.text = arraySpeedResultPV[0]
            //speedTF.resignFirstResponder()
        } else if pickerView.tag == 2 {
            enduranceTF.text = arrayEndurancePV[row]
            inputArrayResult()
            enduranceResultTF.text = arrayEnduranceResultPV[0]
            //enduranceTF.resignFirstResponder()
        } else if pickerView.tag == 3 {
            militarySkillsTF.text = arrayMilitarySkillsPV[row]
            inputArrayResult()
            militarySkillsResultTF.text = arrayMilitarySkillsResultPV[0]
            //militarySkillsTF.resignFirstResponder()
        } else if pickerView.tag == 4 {
            adilityTF.text = arrayAdilityPV[row]
            inputArrayResult()
            adilityResultTF.text = arrayAdilityResultPV[0]
            //adilityTF.resignFirstResponder()
        } else if pickerView.tag == 5 {
            forceResultTF.text = arrayForceResultPV[row]
            //adilityTF.resignFirstResponder()
        } else if pickerView.tag == 6 {
            speedResultTF.text = arraySpeedResultPV[row]
            //adilityTF.resignFirstResponder()
        } else if pickerView.tag == 7 {
            enduranceResultTF.text = arrayEnduranceResultPV[row]
            //adilityTF.resignFirstResponder()
        } else if pickerView.tag == 8 {
            militarySkillsResultTF.text = arrayMilitarySkillsResultPV[row]
            //adilityTF.resignFirstResponder()
        } else if pickerView.tag == 9 {
            adilityResultTF.text = arrayAdilityResultPV[row]
            //adilityTF.resignFirstResponder()
        }
        
    }
    
    func keysInArray(dict:[Int : Int]) -> [String] {
        var keyArray = [String]()
        
        for item in dict {
            keyArray.append(String(item.key))
        }
        keyArray.sorted()
        
        return keyArray
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        if let v = view {
            label = v as! UILabel
        }
        
        label.font = UIFont (name: "Helvetica Neue", size: 11)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        switch pickerView.tag {
        case 0:
            label.text = arrayForcePV[row]
        case 1:
            label.text = arraySpeedPV[row]
        case 2:
            label.text = arrayEndurancePV[row]
        case 3:
            label.text = arrayMilitarySkillsPV[row]
        case 4:
            label.text = arrayAdilityPV[row]
        case 5:
            label.text = arrayForceResultPV[row]
        case 6:
            label.text = arraySpeedResultPV[row]
        case 7:
            label.text = arrayEnduranceResultPV[row]
        case 8:
            label.text = arrayMilitarySkillsResultPV[row]
        case 9:
            label.text = arrayAdilityResultPV[row]
        default:
            label.text = ""
        }
        label.textAlignment = .center
        return label
    }
    
    func addButtonPickerView() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        //let defaultButton = UIBarButtonItem(title: "Начальное", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.tappedToolBarBtn))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ViewController.donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.text = ""
        label.textAlignment = .center
        let textBtn = UIBarButtonItem(customView: label)
        //toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        toolBar.setItems([flexSpace,textBtn,flexSpace,doneButton], animated: true)
        forceTF.inputAccessoryView = toolBar
        speedTF.inputAccessoryView = toolBar
        enduranceTF.inputAccessoryView = toolBar
        militarySkillsTF.inputAccessoryView = toolBar
        adilityTF.inputAccessoryView = toolBar
        
        forceResultTF.inputAccessoryView = toolBar
        speedResultTF.inputAccessoryView = toolBar
        enduranceResultTF.inputAccessoryView = toolBar
        militarySkillsResultTF.inputAccessoryView = toolBar
        adilityResultTF.inputAccessoryView = toolBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressNextResult(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentyfire, sender: nil)
        
        //        let arrays = CategogyParametrsView()
        //        var arraysKey = [String]()
        //
        //        for item in arrays.force {
        //            arraysKey.append("\(item.key), ")
        //        }
        //
        //        for item in arrays.speed {
        //            arraysKey.append("\(item.key), ")
        //        }
        //
        //        for item in arrays.endurance {
        //            arraysKey.append("\(item.key), ")
        //        }
        //
        //        for item in arrays.militarySkills {
        //            arraysKey.append("\(item.key), ")
        //        }
        //
        //        for item in arrays.agility {
        //            arraysKey.append("\(item.key), ")
        //        }
        //        arraysKey = arraysKey.sorted()
        //
        //        print(arraysKey)
        
        //        let resultAmountPoints = ResultAmountPoints()
        //        resultAmountPoints.amountPoints
        //        let amountArray = resultAmountPoints.amountPoints["1"]
        //        print(amountArray![74]!)
        //        print(resultAmountPoints.amountPoints["2"])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func donePressed(sender: UIBarButtonItem) {
        forceTF.resignFirstResponder()
        speedTF.resignFirstResponder()
        enduranceTF.resignFirstResponder()
        militarySkillsTF.resignFirstResponder()
        adilityTF.resignFirstResponder()
        
        forceResultTF.resignFirstResponder()
        speedResultTF.resignFirstResponder()
        enduranceResultTF.resignFirstResponder()
        militarySkillsResultTF.resignFirstResponder()
        adilityResultTF.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ResultViewController else { return }
        
        print(forceTF.text!)
        print(speedTF.text!)
        print(enduranceTF.text!)
        print(militarySkillsTF.text!)
        print(adilityTF.text!)
        
        parametrsDict["forceUpr"] = forceTF.text!
        parametrsDict["speedUpr"] = speedTF.text!
        parametrsDict["enduranceUpr"] = enduranceTF.text!
        parametrsDict["militarySkillsUpr"] = militarySkillsTF.text!
        parametrsDict["adilityUpr"] = adilityTF.text!
        
        parametrsDict["forceResult"] = forceResultTF.text!
        parametrsDict["speedResult"] = speedResultTF.text!
        parametrsDict["enduranceResult"] = enduranceResultTF.text!
        parametrsDict["militarySkillsResult"] = militarySkillsResultTF.text!
        parametrsDict["adilityResult"] = adilityResultTF.text!
        
        dvc.parametrsDict = parametrsDict
    }
}
