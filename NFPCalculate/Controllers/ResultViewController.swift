//
//  ResultViewController.swift
//  NFPCalculate
//
//  Created by EVladimirA on 02.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var totalRating: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.clipsToBounds = true
        resultView.layer.cornerRadius = 15
        resultView.layer.masksToBounds = true
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


extension ResultViewController: UITableViewDelegate {}

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultTableViewCell
        
        cell.workoutLabel.text = "Упражнение сгибание рук"
        cell.ratingLabel.text = "100"
        cell.resultLabel.text = "100"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
