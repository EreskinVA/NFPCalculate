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
    
    var forcePV = UIPickerView()
    var speedPV = UIPickerView()
    var endurancePV = UIPickerView()
    var militarySkillsPV = UIPickerView()
    var adilityPV = UIPickerView()
    
    var arrayForcePV: Array = [String]()
    var arraySpeedPV: Array = [String]()
    var arrayEndurancePV: Array = [String]()
    var arrayMilitarySkillsPV: Array = [String]()
    var arrayAdilityPV: Array = [String]()

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
        
        forcePV.tag = 0
        speedPV.tag = 1
        endurancePV.tag = 2
        militarySkillsPV.tag = 3
        adilityPV.tag = 4
        
        forceTF.inputView = forcePV
        speedTF.inputView = speedPV
        enduranceTF.inputView = endurancePV
        militarySkillsTF.inputView = militarySkillsPV
        adilityTF.inputView = adilityPV
        
        forceTF.textAlignment = .center
        speedTF.textAlignment = .center
        enduranceTF.textAlignment = .center
        militarySkillsTF.textAlignment = .center
        adilityTF.textAlignment = .center
        
        addButtonPickerView()
        
        // заполнение полей по умолчанию
        
        inputArray()
        forceTF.text = arrayForcePV[0]
        speedTF.text = arraySpeedPV[0]
        enduranceTF.text = arrayEndurancePV[0]
        militarySkillsTF.text = arrayMilitarySkillsPV[0]
        adilityTF.text = arrayAdilityPV[0]
        
    }
    
    func inputArray() {
        
        let arrays = CategogyParametrsView()
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
        
        for item in arrays.agility {
            arrayAdilityPV.append("\(item.value) (Упр. №\(item.key))")
        }
        arrayAdilityPV = arrayAdilityPV.sorted()
        
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
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            forceTF.text = arrayForcePV[row]
            //forceTF.resignFirstResponder()
        } else if pickerView.tag == 1 {
            speedTF.text = arraySpeedPV[row]
            //speedTF.resignFirstResponder()
        } else if pickerView.tag == 2 {
            enduranceTF.text = arrayEndurancePV[row]
            //enduranceTF.resignFirstResponder()
        } else if pickerView.tag == 3 {
            militarySkillsTF.text = arrayMilitarySkillsPV[row]
            //militarySkillsTF.resignFirstResponder()
        } else if pickerView.tag == 4 {
            adilityTF.text = arrayAdilityPV[row]
            //adilityTF.resignFirstResponder()
        }
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressNextResult(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentyfire, sender: nil)
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
    }
}
