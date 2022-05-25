  //
  //  CalculatorBrain.swift
  //  Tipsy
  //
  //  Created by Victor Cruz Galindo on 25/05/22.
  //  Copyright © 2022 The App Brewery. All rights reserved.
  //

import Foundation

struct CalculatorBrain {
  var percent: Float = 0.1
  var numberOfPeople: Float = 2.0
  var countAmount: Float = 0.0
  var dividedPayment: Float = 0.0

  mutating func getAmoutDivided() -> Void {
    self.dividedPayment = (self.countAmount + (self.countAmount * self.percent)) / self.numberOfPeople
  }

  func getPercent() -> String {
    return String( format: "%.0f", self.percent * 100) + "%"
  }
  
  func getDividedPay() -> String {
    return String(format: "%.2f", dividedPayment)
  }

  func getNumberOfPeople() -> String {
    String(format: "%.0f", numberOfPeople)
  }
}
