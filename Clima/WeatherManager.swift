  //
  //  WeatherManager.swift
  //  Clima
  //
  //  Created by Victor Cruz Galindo on 26/05/22.
  //  Copyright © 2022 App Brewery. All rights reserved.
  //

import UIKit

protocol WeatherManagerDelegate {
  func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
  func didFailWithError(_ error: Error)
}

struct WeatherManager {
  let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather?appid=f07139de5168665d6bee4fde3a729a7c&units=metric"

  var delegate: WeatherManagerDelegate?

  func fetchWeather(cityName: String) {
    let urlString: String = "\(weatherURL)&q=\(cityName)"
    performRequest(with: urlString)
  }

  func performRequest(with urlString: String) {
      // 1. Create URL
    if let url: URL = URL(string: urlString) {

        // 2. Create URLSession
      let session: URLSession = URLSession(configuration: .default)

        // 3. Give session a task
      let task: URLSessionTask = session.dataTask(with: url) { data, response, error in
        if error != nil {
          self.delegate?.didFailWithError(error!)
          return
        }
        if let safeData = data {
          if let weather = self.parseJSON(safeData) {
            self.delegate?.didUpdateWeather(self, weather: weather)
          }
        }
      }

        // 4. Start task
      task.resume()
    }

  }

  func parseJSON(_ weatherData: Data) -> WeatherModel? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
      let id = decodedData.weather[0].id
      let temp = decodedData.main.temp
      let name = decodedData.name

      let weather = WeatherModel(conditionId: id, cityName: name, temp: temp)
      return weather
    } catch {
      delegate?.didFailWithError(error)
      return nil
    }
  }

  

}
