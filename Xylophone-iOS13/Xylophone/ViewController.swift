import UIKit
import AVFoundation

class ViewController: UIViewController {

  var player: AVAudioPlayer!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func keyPressed(_ sender: UIButton) {
    guard let title = sender.currentTitle else {
      return
    }
    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      sender.alpha = 1
    }
    playSound(letter: title)
  }

  func playSound(letter: String) {
    let url = Bundle.main.url(forResource: letter, withExtension: "wav")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()

  }
}
