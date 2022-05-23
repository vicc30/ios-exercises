//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var heightSlider: UISlider!

  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var weigthSlider: UISlider!

  var calculatorBrain = CalculatorBrain()

  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  @IBAction func heightSliderChange(_ sender: UISlider) {
    let height: String = String( format: "%.2f", sender.value)
    heightLabel.text = "\(height) m"
  }

  @IBAction func weightSliderChange(_ sender: UISlider) {
    let weight: String = String( format: "%.0f", sender.value)
    weightLabel.text = weight + " kg"
  }

  @IBAction func calculatePressed(_ sender: UIButton) {
    let weight = weigthSlider.value
    let height = heightSlider.value

    calculatorBrain.calculateBMI(height: height, weight: weight)
    self.performSegue(withIdentifier: "goToResult", sender: self)

      // Programatically push another view
      // let secondVC = SecondViewController()
      // secondVC.bmiValue = String(format: "%.1f",bmi)
      // self.present(secondVC, animated: true, completion: nil)
  }

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "goToResult") {
      let destinationVC = segue.destination as! ResultViewController
      destinationVC.bmiValue = calculatorBrain.getBMIValue()
      destinationVC.advice = calculatorBrain.getAdvice()
      destinationVC.color = calculatorBrain.getColor()
    }
  }


}

