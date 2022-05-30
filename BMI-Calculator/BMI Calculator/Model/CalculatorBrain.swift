//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Victor Cruz Galindo on 20/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
  var bmi: BMI?

  mutating func calculateBMI(height: Float, weight: Float) -> Void {
    let bmiValue = weight / pow(height, 2)

    switch bmiValue {
    case ..<18.5:
      bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemPurple)
    case 18.5...24.9:
      bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: UIColor.systemGreen )
    case 24.9...:
      bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.systemTeal )
    default:
      bmi = BMI(value: bmiValue, advice: "Error in Calculation", color: UIColor.red )
    }

  }

  func getBMIValue() -> String {
    return String(format: "%.1f", bmi?.value ?? 0.0)

  }

  func getAdvice() -> String {
    return bmi?.advice ?? "No advice"
  }

  func getColor() -> UIColor {
    return bmi?.color ?? UIColor.red
  }
}
