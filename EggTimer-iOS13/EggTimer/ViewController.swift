//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {

  @IBOutlet weak var titleText: UILabel!
  @IBOutlet weak var timerBar: UIProgressView!
  var player: AVAudioPlayer!

  let eggTime: [String: Float] = [
    "Soft": 3.0,
    "Medium": 4.0,
    "Hard": 7.0
  ]

  var secondsRemain: Float = 60
  var totalTime: Float = 0
  var timer: Timer = Timer()

  @IBAction func hardnessSelected(_ sender: UIButton) {

    guard let hardness: String = sender.currentTitle else {
      return
    }
    timerBar.progress = 0.0
    titleText.text = "How do you like your eggs?"
    totalTime = eggTime[hardness] ?? 720
    secondsRemain = 0
    countDown()
  }

  func countDown() -> Void {
    timer.invalidate()
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
  }

  @objc func updateTimer(){
    if(secondsRemain < totalTime) {
      secondsRemain += 1
      timerBar.progress = secondsRemain/totalTime
    } else {
      titleText.text = "Your eggs are done!"
      timer.invalidate()
      playSound()
    }
  }

  func playSound() {
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
  }
}
