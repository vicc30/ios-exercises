//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  // IBOutlet allows me to reference a storyboard element.
  @IBOutlet weak var diceImageViewOne: UIImageView!
  @IBOutlet weak var diceImageViewTwo: UIImageView!

  // Interface builder action
  @IBAction func rollButtonPressed(_ sender: UIButton) {

    //constant array
    let diceArr = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]

    // randomElement gives a random element of array
    diceImageViewOne.image = diceArr.randomElement()

    // we need to give a range when we use Int.random(in: range)
    diceImageViewTwo.image = diceArr[Int.random(in: 0...5)]

  }
}

