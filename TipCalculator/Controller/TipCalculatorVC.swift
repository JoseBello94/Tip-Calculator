//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jose Bello on 4/14/20.
//  Copyright © 2020 Jose Bello. All rights reserved.
//

import UIKit

class TipCalculatorVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipPctLable: UILabel!
    @IBOutlet weak var peopleToSplitLable: UILabel!
    var tipPct = 0.05
    var peopleAmount = 1
    var billTotal = 0.0     //Amount input in the billTextField
    var finalResult = "0.0"     //result to transfer to the resultView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    //Increment tip percentage
    @IBAction func tipStepperPressed(_ sender: UIStepper) {
        billTextField.endEditing(true)
        if sender.value == 1.0 {
            sender.value = 6.0
        }
        sender.minimumValue = 5
        tipPctLable.text = String(format: "%.0f%@", (sender.value), "%")
        tipPct = sender.value / 100
    }
    
    //Increase amount of people
    @IBAction func peopleStepperPressed(_ sender: UIStepper) {
        billTextField.endEditing(true)
        sender.minimumValue = 1.0
        if sender.value == 1.0 && peopleAmount == 1 {
            sender.value = 2.0
        }
        if sender.value > 1.0 {
            peopleToSplitLable.text = String(format: "%.0f %@", sender.value, "persons")
        }
        else {
            peopleToSplitLable.text = String(format: "%.0f %@", sender.value, "person")
        }
        peopleAmount = Int(sender.value)
    }
    
    //Calculate tip pctage per people
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? "0.0"
        billTotal = Double(bill)!
        finalResult = String(format: "%.2f", billTotal * (1 + tipPct) / Double(peopleAmount))

        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPP = String(format: "$%@", finalResult)
            destinationVC.brokenDownText = String(format: "Total Tip: $%.2f\nTip per person: $%.2f", (billTotal * tipPct), (billTotal * tipPct / Double(peopleAmount)))
        }
    }
    
}

