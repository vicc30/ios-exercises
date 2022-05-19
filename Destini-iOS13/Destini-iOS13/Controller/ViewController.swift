//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet weak var storyLabel: UILabel!
  @IBOutlet weak var choice1Button: UIButton!
  @IBOutlet weak var choice2Button: UIButton!

  var storyBrain = StoryBrain()

  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }

  @IBAction func choiceMade(_ sender: UIButton) {
    let titleText = sender.titleLabel?.text
    storyBrain.nextStory(choice: titleText!)
    updateUI()
  }

  func updateUI() -> Void {
    storyLabel.text = storyBrain.stories[storyBrain.storyLine].title
    choice1Button.setTitle(storyBrain.stories[storyBrain.storyLine].choice1, for: .normal)
    choice2Button.setTitle(storyBrain.stories[storyBrain.storyLine].choice2, for: .normal)
  }
}

