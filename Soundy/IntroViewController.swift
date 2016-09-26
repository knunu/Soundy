//
//  IntroViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 5..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit
import AVFoundation
import Gifu

class IntroViewController: UIViewController {
    
    @IBOutlet weak var alarmView: UIView!
    @IBOutlet weak var backgroundView: AnimatableImageView!
    @IBOutlet weak var repeatedBackgroundView: AnimatableImageView!
    @IBOutlet weak var warningImageView: UIImageView!
    @IBOutlet weak var warningButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    fileprivate var player: AVAudioPlayer!
    fileprivate var globalTimer = Timer()
    fileprivate var alarmTimer = Timer()
    
    fileprivate let bellURL: URL = Bundle.main.url(forResource: "bell", withExtension: "wav")!
    fileprivate let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    fileprivate let weekdayList = ["토요일", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setThePresent()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SoundyViewSegue" {
//            
//        }
//    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.stopItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setBackgroundView()
    }

    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.landscapeLeft, UIInterfaceOrientationMask.landscapeRight]
    }
    
    
    @IBAction func onClickAlarmButton() {
        alarmView.isHidden = false
        backgroundView.startAnimatingGIF()
        alarmTimer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(self.repeatBackgroundView), userInfo: nil, repeats: false)
//        alarmTimer.fire()
        showWarningView()
        playBell()
    }
    
    fileprivate func setBackgroundView() {
        warningImageView.alpha = 0.0
        warningButton.alpha = 0.0
        alarmView.isHidden = true
        backgroundView.isHidden = false
        backgroundView.needsPrescaling = false
        backgroundView.prepareForAnimation(withGIFNamed: "intro_alarm.gif")
        
        repeatedBackgroundView.isHidden = true
        repeatedBackgroundView.needsPrescaling = false
        repeatedBackgroundView.prepareForAnimation(withGIFNamed: "repeated_alarm.gif")
    }
    
    @objc fileprivate func repeatBackgroundView() {
        backgroundView.isHidden = true
        backgroundView.stopAnimatingGIF()
        repeatedBackgroundView.isHidden = false
        repeatedBackgroundView.startAnimatingGIF()
    }
    
    @objc fileprivate func refreshTime() {
        let component = (calendar as NSCalendar).components([.year, .month, .day, .weekday, .hour, .minute], from: Date())
        
        timeLabel.text = "\(component.hour!):\(String(format: "%02d", component.minute!))"
    }
    
    fileprivate func setThePresent() {
        let component = (calendar as NSCalendar).components([.year, .month, .day, .weekday, .hour, .minute], from: Date())
        let weekday = weekdayList[component.weekday! % 7]
        
        dateLabel.text = "\(component.year!)년 \(component.month!)월 \(component.day!)일"
        weekLabel.text = "\(weekday)"
        timeLabel.text = "\(component.hour!):\(String(format: "%02d", component.minute!))"
        
        globalTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(IntroViewController.refreshTime), userInfo: nil, repeats: true)
    }
    

    fileprivate func showWarningView() {
        UIView.animate(withDuration: 0.5, delay: 2.0, options: [], animations: {
            self.warningImageView.alpha = 1.0
            }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 2.5, options: [], animations: {
            self.warningButton.alpha = 1.0
            }, completion: nil)
    }
    
    fileprivate func playBell() {
        do {
            player = try AVAudioPlayer(contentsOf: bellURL)
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    fileprivate func stopItems() {
        if player != nil {
            player.stop()
            player = nil
        }
        
        alarmView.isHidden = true
        self.backgroundView.prepareForReuse()
        self.repeatedBackgroundView.prepareForReuse()
    }
}

