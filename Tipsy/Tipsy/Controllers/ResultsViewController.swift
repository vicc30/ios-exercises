  //
  //  ResultsViewController.swift
  //  Tipsy
  //
  //  Created by Victor Cruz Galindo on 23/05/22.
  //  Copyright © 2022 The App Brewery. All rights reserved.
  //

import UIKit

class ResultsViewController: UIViewController {

  var percent: String?
  var numberOfPeople: String?
  var dividedPayment: String?

  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    settingsLabel.text = getSettingsText()
    totalLabel.text = getTotal()
  }

  func getSettingsText() -> String {
    if (numberOfPeople != nil && percent != nil) {
      return "Split between \(numberOfPeople!) people, with \(percent!) tip."
    }

    return "Try it again"
  }

  func getTotal() -> String {
    if (dividedPayment != nil) {
      return "$ \(dividedPayment!)"
    }

    return "Err"
  }

  @IBAction func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

}
