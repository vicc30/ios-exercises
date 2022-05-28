  //
  //  WeatherModel.swift
  //  Clima
  //
  //  Created by Victor Cruz Galindo on 27/05/22.
  //  Copyright © 2022 App Brewery. All rights reserved.
  //

import Foundation

struct WeatherModel {
  let conditionId: Int
  let cityName: String
  let temp: Double

  var temperatureString: String {
    String(format: "%.1f", temp)
  }

  // Computed property
  var conditionName: String {
    switch conditionId {
      case 200...202:
        return "cloud.bolt.rain"
      case 210...221:
        return "cloud.bolt"
      case 230...232:
        return "cloud.bolt.rain"
      case 300...321:
        return "cloud.drizzle"
      case 500...531:
        return "cloud.rain"
      case 600...622:
        return "cloud.snow"
      case 700...781:
        return "cloud.fog"
      case 800:
        return "sun.max"
      case 801...804:
        return "cloud.sun"
      default:
        return "questionmark.circle"
    }
  }
}
