//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

//MARK: -  ViewController
final class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  @IBOutlet weak var currencyLabel: UILabel!
  @IBOutlet weak var bitcoinLabel: UILabel!
  @IBOutlet weak var currencyPicker: UIPickerView!

  let coinManager = CoinManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    currencyPicker.dataSource = self
    currencyPicker.delegate = self
  }

  //MARK: -  UIPickerViewDataSource
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return coinManager.currencyArray.count
  }

  //MARK: -  UIPickerViewDelegate
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return coinManager.currencyArray[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let currency: String = coinManager.currencyArray[row]
    coinManager.getCoinPrice(for: currency)
  }
}

