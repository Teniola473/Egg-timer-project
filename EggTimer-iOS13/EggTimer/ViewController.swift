
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titileLabel: UILabel!
    //constant
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    //Dictionary
    let eggTimes = ["Soft": 5,"Medium": 7, "Hard": 10]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1.0
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titileLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        //using if/else satement
//        if hardness == "Soft"{
//            print(softTime)
//        } else if hardness == "Medium" {
//            print (mediumTime)
//        } else {
//            print (hardTime)
//        }
        
        //using switch statement
//        switch hardness {
//        case "Soft":
//            print(eggTimes)
//        case "Medium":
//            print (eggTimes)
//        case "Hard":
//            print (eggTimes)
//        default:
//            print("Error")
//        }
        
        //optional
//        let result = eggTimes[hardness]!
//        print(result)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titileLabel.text = "DONE!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    
    func playSound(soundName: String) {
            if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
                player = try! AVAudioPlayer(contentsOf: url)
                player.play()
            } else {
                print("Could not find file: \(soundName).mp3")
            }
        }
}
