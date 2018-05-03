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
        
    }
    
    func inputArrayAge() {
        arrayAgePickerView.removeAll()
        for index in 18...54 {
            arrayAgePickerView.append("\(index)")
        }
        arrayAgePickerView.append("55 и более")
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            ageTF.text = arrayAgePickerView[row]
            ageTF.resignFirstResponder()
        } else if pickerView.tag == 1 {
            statusTF.text = arrayStatusPickerView[row]
            statusTF.resignFirstResponder()
        }
    }
    
    @IBAction func pressAge(_ sender: UITextField) {
        inputArrayAge()
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
    
    func animatedLabel(label: UILabel) {
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            label.textColor = UIColor.red
            label.alpha = 0
        }) { complete in
            label.textColor = UIColor.white
            label.alpha = 1
        }
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
}

