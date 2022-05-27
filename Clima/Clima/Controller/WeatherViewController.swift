//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var conditionImageView: UIImageView!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!

  var weatherManager = WeatherManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    searchTextField.delegate = self
  }

  // Delegate to handle go on keyboard
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchTextField.endEditing(true)
    print(searchTextField.text!)
    return true
  }

  func textFieldDidEndEditing(_ textField: UITextField) {

    if let city = searchTextField.text {
      self.weatherManager.fetchWeather(cityName: city)
    }
    searchTextField.text = ""
    searchTextField.placeholder = "Search"
  }

  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if textField.text != "" {
      return true
    } else {
      textField.placeholder = "Type something"
      return false
    }
  }

  @IBAction func searchPressed(_ sender: UIButton) {
    // Close keyboard
    searchTextField.endEditing(true)
    weatherManager.fetchWeather(cityName:searchTextField.text!)
  }

}

