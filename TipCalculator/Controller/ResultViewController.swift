//
//  ResultViewController.swift
//  TipCalculator
//
//  Created by Jose Bello on 4/15/20.
//  Copyright © 2020 Jose Bello. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalPerPersonLable: UILabel!
    @IBOutlet weak var brokenDownLable: UILabel!
    var totalPP: String?
    var brokenDownText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPersonLable.text = totalPP
        brokenDownLable.text = brokenDownText
    }
    
    //Go back to the calculate screen
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
