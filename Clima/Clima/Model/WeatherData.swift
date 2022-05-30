//
//  WeatherData.swift
//  Clima
//
//  Created by Victor Cruz Galindo on 27/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
  let coord: Coord
  let weather: [Weather]
  let base: String
  let main: Main
  let visibility: Int
  let wind: Wind
  let clouds: Clouds
  let dt: Int
  let sys: Sys
  let timezone, id: Int
  let name: String
  let cod: Int
}


  // MARK: - Clouds
struct Clouds: Codable {
  let all: Int
}

  // MARK: - Coord
struct Coord: Codable {
  let lon, lat: Double
}

  // MARK: - Main
struct Main: Codable {
  let temp, feelsLike, tempMin, tempMax: Double
  let pressure, humidity: Int

  enum CodingKeys: String, CodingKey {
    case temp, pressure, humidity
    case feelsLike = "feels_like"
    case tempMin = "temp_min"
    case tempMax = "temp_max"
  }
}

  // MARK: - Sys
struct Sys: Codable {
  let type, id, sunrise, sunset: Int
  let country: String
}

  // MARK: - Weather
struct Weather: Codable {
  let id: Int
  let main, description, icon: String

  enum CodingKeys: String, CodingKey {
    case id, main, description, icon
  }
}

  // MARK: - Wind
struct Wind: Codable {
  let speed: Double
  let deg: Int
}

