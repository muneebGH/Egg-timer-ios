
import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    

    var player:AVAudioPlayer?
    var timer:Timer?
    var totalTime:Float=0.0
    var startTime:Float=0.0
    let eggTimes=["Soft":300 , "Medium":420 , "Hard":720]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        progressView.progress=0
        startTime=0.0
      
        label.text="How do you like your eggs?"
        timer?.invalidate()
        
        totalTime=Float(eggTimes[sender.currentTitle!]!)
        startTimer()
        
    }
    
    func startTimer(){
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime(){
       
        
        
        startTime+=1
        
        progressView.progress=startTime/totalTime
        
        if startTime==totalTime{
            timer?.invalidate()
            label.text="Done!"
            
            let url=Bundle.main.url(forResource:"alarm_sound" , withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
        
    }
    
    

}
