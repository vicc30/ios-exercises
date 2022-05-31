//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Victor Cruz Galindo on 31/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
  let price: Double
  let currency: String

  var priceString: String {
    String(format: "%.2f", price)
  }
}
