//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
  func didUpdateWeather(_ coinManager: CoinManager, coin: CoinModel)
  func didFailWithError(_ error: Error)
}

struct CoinManager {

  var delegate: CoinManagerDelegate?

  let baseURL: String = "https://rest.coinapi.io/v1/exchangerate/BTC"
  let apiKey: String = "210009BA-B56E-45A7-99C2-3E0B3FE06222"

  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

  func getCoinPrice(for currency: String) {
    let urlString: String = "\(baseURL)/\(currency)?apikey=\(apiKey)"
    performRequest(with: urlString)
  }

  func performRequest(with urlString: String) {
    if let url: URL = URL(string: urlString)  {
      let session: URLSession = URLSession(configuration: .default)
      let task: URLSessionTask = session.dataTask(with: url) { data, response, error in
        if error != nil {
          self.delegate?.didFailWithError(error!)
          return
        }
        if let safeData = data {
          if let exchange = self.parseJSON(safeData) {
            self.delegate?.didUpdateWeather(self, coin: exchange)
          }
        }
      }
      task.resume()
    }
  }

  func parseJSON(_ data: Data) -> CoinModel? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(CoinData.self, from: data)
      let lastPrice = decodedData.rate
      let currency = decodedData.assetIDQuote

      let coinModel = CoinModel(price: lastPrice, currency: currency)

      return coinModel

    } catch {
      self.delegate?.didFailWithError(error)
      return nil
    }
  }

}
