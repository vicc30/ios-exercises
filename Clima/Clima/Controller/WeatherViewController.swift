  //
  //  ViewController.swift
  //  Clima
  //
  //  Created by Angela Yu on 01/09/2019.
  //  Copyright © 2019 App Brewery. All rights reserved.
  //

import UIKit
import CoreLocation

  //MARK: -  WeatherViewController
class WeatherViewController: UIViewController {

  @IBOutlet weak var conditionImageView: UIImageView!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!

  var weatherManager = WeatherManager()
  let locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()

    weatherManager.delegate = self
    searchTextField.delegate = self
  }

  @IBAction func currentLocation(_ sender: UIButton) {
    locationManager.requestLocation()
  }

}


  //MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {

  @IBAction func searchPressed(_ sender: UIButton) {
      // Close keyboard
    searchTextField.endEditing(true)
    weatherManager.fetchWeather(cityName:searchTextField.text!)
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

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchTextField.endEditing(true)
    print(searchTextField.text!)
    return true
  }

}

  //MARK: -  WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {

  func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {

    DispatchQueue.main.async {
      self.temperatureLabel.text = weather.temperatureString
      self.conditionImageView.image = UIImage(systemName: weather.conditionName)
      self.cityLabel.text = weather.cityName
    }
  }

  func didFailWithError(_ error: Error) {
    print(error)
  }

}

//MARK: -  CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
      locationManager.stopUpdatingLocation()
      let lat = location.coordinate.latitude
      let lon = location.coordinate.longitude

      self.weatherManager.fetchWeather(latitude: lat, longitude: lon)

    }
    print("got location data")
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
}
