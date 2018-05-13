//
//  ViewController.swift
//  NFPCalculate
//
//  Created by EVladimirA on 02.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var arrayAgePickerView: Array = [String]()
    var arrayStatusPickerView: Array = [String]()
    
    let segueIdentyfire = "parametrSegue"
    
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var genderSC: UISegmentedControl!
    @IBOutlet weak var workoutSC: UISegmentedControl!
    @IBOutlet weak var categorySC: UISegmentedControl!
    @IBOutlet weak var statusTF: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var agePickerView = UIPickerView()
    var statusPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // установка PickerView
        
        agePickerView.delegate = self
        agePickerView.dataSource = self
        statusPickerView.delegate = self
        statusPickerView.dataSource = self
        
        agePickerView.tag = 0
        statusPickerView.tag = 1
        
        ageTF.inputView = agePickerView
        ageTF.textAlignment = .center
        ageTF.placeholder = "Выберите возраст"
        
        statusTF.inputView = statusPickerView
        statusTF.textAlignment = .center
        statusTF.placeholder = "Выберите статус"
        
        addButtonPickerView()
        // заполнение полей по умолчанию
        
        inputArrayAge()
        ageTF.text = arrayAgePickerView[0]
        
        inputArrayStatus()
        statusTF.text = arrayStatusPickerView[0]
    }
    
    // формирование массива возрастов
    func inputArrayAge() {
        arrayAgePickerView.removeAll()
        for index in 18...54 {
            arrayAgePickerView.append("\(index)")
        }
        arrayAgePickerView.append("55 и более")
    }
    
    // формирование массива статусов
    func inputArrayStatus() {
        arrayStatusPickerView.removeAll()
        if genderSC.selectedSegmentIndex == 0 {
            arrayStatusPickerView.append("По контракту")
            arrayStatusPickerView.append("Кандидат в ВВУЗ")
            arrayStatusPickerView.append("Новое пополнение воинских частей")
            arrayStatusPickerView.append("По призыву до 6 мес, курсанты 1-го курса")
            arrayStatusPickerView.append("По призыву после 6 месяцев")
            arrayStatusPickerView.append("Курсанты 2-го курса")
            arrayStatusPickerView.append("Курсанты 3-го курса и старше")
        } else {
            arrayStatusPickerView.append("По контракту")
            arrayStatusPickerView.append("Кандидат в ВВУЗ жен. пола")
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return arrayAgePickerView.count
        case 1:
            return arrayStatusPickerView.count
        default:
            return 0
        }
    }
    /*
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     switch pickerView.tag {
     case 0:
     return arrayAgePickerView[row]
     case 1:
     return arrayStatusPickerView[row]
     default:
     return ""
     }
     }
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            ageTF.text = arrayAgePickerView[row]
            //ageTF.resignFirstResponder()
        } else if pickerView.tag == 1 {
            statusTF.text = arrayStatusPickerView[row]
            //statusTF.resignFirstResponder()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        
        switch pickerView.tag {
        case 0:
            label.font = UIFont (name: "Helvetica Neue", size: 20)
            label.text =  arrayAgePickerView[row]
        case 1:
            label.font = UIFont (name: "Helvetica Neue", size: 15)
            label.text =  arrayStatusPickerView[row]
        default:
            label.text = ""
        }
        label.textAlignment = .center
        return label
    }
    
    @IBAction func pressAge(_ sender: UITextField) {
        // inputArrayAge()
    }
    
    @IBAction func pressStatus(_ sender: UITextField) {
        inputArrayStatus()
    }
    
    @IBAction func pressSihnOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // анимация Label
    func animatedLabel(label: UILabel) {
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            label.textColor = UIColor.red
            label.alpha = 0
        }) { complete in
            label.textColor = UIColor.white
            label.alpha = 1
        }
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
        label.text = "Возраст"
        label.textAlignment = .center
        let textBtn = UIBarButtonItem(customView: label)
        //toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        toolBar.setItems([flexSpace,textBtn,flexSpace,doneButton], animated: true)
        ageTF.inputAccessoryView = toolBar
        statusTF.inputAccessoryView = toolBar
    }
    
    @IBAction func pressNext(_ sender: UIButton) {
        
        let age = ageTF.text!
        let status = statusTF.text!
        
        guard ((age != "") || (status != "")) else {
            animatedLabel(label: statusLabel)
            animatedLabel(label: ageLabel)
            return
        }
        guard age != "" else {
            animatedLabel(label: ageLabel)
            return
        }
        guard status != "" else {
            animatedLabel(label: statusLabel)
            return
        }
        performSegue(withIdentifier: segueIdentyfire, sender: nil)
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        self.view.endEditing(true)
//        if genderSC.titleForSegment(at: genderSC.selectedSegmentIndex) == "Жен." {
//            workoutSC.setEnabled(false, forSegmentAt: 1)
//            workoutSC.setEnabled(false, forSegmentAt: 2)
//        } else {
//            workoutSC.setEnabled(true, forSegmentAt: 1)
//            workoutSC.setEnabled(true, forSegmentAt: 2)
//        }
        inputArrayStatus()
//        workoutSC.selectedSegmentIndex = 0
        statusTF.text = arrayStatusPickerView[0]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ParametrsViewController else { return }
        dvc.parametrsDict["age"] = ageTF.text!
        dvc.parametrsDict["gender"] = genderSC.titleForSegment(at: genderSC.selectedSegmentIndex)
        dvc.parametrsDict["workout"] = workoutSC.titleForSegment(at: workoutSC.selectedSegmentIndex)
        dvc.parametrsDict["category"] = categorySC.titleForSegment(at: categorySC.selectedSegmentIndex)
        dvc.parametrsDict["status"] = statusTF.text!
        print(dvc.parametrsDict)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func donePressed(sender: UIBarButtonItem) {
        ageTF.resignFirstResponder()
        statusTF.resignFirstResponder()
    }
    /*
     @objc func tappedToolBarBtn(sender: UIBarButtonItem) {
     ageTF.text = "one"
     ageTF.resignFirstResponder()
     
     statusTF.text = "one"
     statusTF.resignFirstResponder()
     }
     */
}


