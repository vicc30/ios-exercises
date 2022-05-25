  //
  //  ViewController.swift
  //  Tipsy
  //
  //  Created by Angela Yu on 09/09/2019.
  //  Copyright © 2019 The App Brewery. All rights reserved.
  //

import UIKit

class CalculatorViewController: UIViewController {

  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!

  var calculatorBrain = CalculatorBrain()

  @IBAction func tipChanged(_ sender: UIButton) {

    let tipPercent: String = sender.titleLabel?.text ?? "10%"

    switch tipPercent {

    case "0%":
      zeroPctButton.isSelected = true
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = false
      calculatorBrain.percent = 0.0

    case "10%":
      zeroPctButton.isSelected = false
      tenPctButton.isSelected = true
      twentyPctButton.isSelected = false
      calculatorBrain.percent = 0.1

    case "20%":
      zeroPctButton.isSelected = false
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = true
      calculatorBrain.percent = 0.2

    default:
      zeroPctButton.isSelected = true
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = false
      calculatorBrain.percent = 0.0

    }

  }

  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    let numberOfPeopleString = String(format: "%.0f", sender.value)
    splitNumberLabel.text = numberOfPeopleString
    calculatorBrain.numberOfPeople = Float(numberOfPeopleString) ?? 2.0
  }

  @IBAction func calculatePressed(_ sender: UIButton) {
    let amountString: String = billTextField.text ?? "0.0"

    billTextField.endEditing(true)

    calculatorBrain.countAmount = Float(amountString) ?? 0.0
    calculatorBrain.getAmoutDivided()

    self.performSegue(withIdentifier: "goToTotal", sender: self)

  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "goToTotal") {
      let destinationVC = segue.destination as! ResultsViewController

      destinationVC.percent = calculatorBrain.getPercent()
      destinationVC.dividedPayment = calculatorBrain.getDividedPay()
      destinationVC.numberOfPeople = calculatorBrain.getNumberOfPeople()

    }
  }

}

