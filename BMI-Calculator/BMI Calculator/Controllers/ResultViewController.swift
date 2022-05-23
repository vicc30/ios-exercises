//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Victor Cruz Galindo on 19/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

  var bmiValue: String?
  var advice: String?
  var color: UIColor?

  @IBOutlet weak var bmiLabel: UILabel!
  @IBOutlet weak var adviceLabel: UILabel!
  @IBOutlet weak var background: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    bmiLabel.text = bmiValue ?? "0.0"
    adviceLabel.text = advice ?? "Error"
    background.backgroundColor = color ?? UIColor.red
  }
    

  @IBAction func recalculatedPressed(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }


}
