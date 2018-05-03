//
//  ParametrsViewController.swift
//  NFPCalculate
//
//  Created by EVladimirA on 02.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import UIKit

class ParametrsViewController: UIViewController {

    var parametrsDict = [String: String]()
    
    let segueIdentyfire = "resultSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressNextResult(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentyfire, sender: nil)
    }
    

}
