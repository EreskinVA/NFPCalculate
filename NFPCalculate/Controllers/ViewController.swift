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

    var arrayPickerView: Array = [String]()
    
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var genderSC: UISegmentedControl!
    @IBOutlet weak var workoutSC: UISegmentedControl!
    @IBOutlet weak var categorySC: UISegmentedControl!
    @IBOutlet weak var statusTF: UITextField!
    
    var agePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agePickerView.delegate = self
        agePickerView.dataSource = self
        
        
        
        ageTF.inputView = agePickerView
        ageTF.textAlignment = .center
        ageTF.placeholder = "Выберите возраст"
        
        statusTF.inputView = agePickerView
        statusTF.textAlignment = .center
        statusTF.placeholder = "Выберите статус"
        
    }
    
    func inputArrayAge () {
        arrayPickerView.removeAll()
        for index in 18...54 {
            arrayPickerView.append("\(index) лет")
        }
        arrayPickerView.append("55 и более")
    }
    
    func inputStatus() {
        arrayPickerView.removeAll()
        arrayPickerView.append("По контракту")
        arrayPickerView.append("Кандидат в ВВУЗ")
        arrayPickerView.append("Кандидат в ВВУЗ жен. пола")
        arrayPickerView.append("Новое пополнение воинских частей")
        arrayPickerView.append("По призыву до 6 мес, курсанты 1-го курса")
        arrayPickerView.append("По призыву после 6 месяцев")
        arrayPickerView.append("Курсанты 2-го курса")
        arrayPickerView.append("Курсанты 3-го курса и старше")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(component)
        return arrayPickerView[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        ageTF.text = arrayPickerView[row]
        ageTF.resignFirstResponder()
    }
    
    @IBAction func pressAge(_ sender: UITextField) {
        inputArrayAge()
    }
    @IBAction func pressStatus(_ sender: UITextField) {
        inputStatus()
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


}

