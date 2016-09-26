//
//  InterphoneViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 10..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit

class InterphoneViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    
    fileprivate let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    fileprivate let weekdayList = ["토요일", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일"]
    fileprivate var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "인터폰"
        endButton.isHidden = true
        self.setThePresent()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickHomeButton() {
        self.dismiss(animated: false, completion: nil);
    }
    
    @IBAction func onClickAcceptButton() {
        acceptButton.isHidden = true
        rejectButton.isHidden = true
        endButton.isHidden = false
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
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(InterphoneViewController.refreshTime), userInfo: nil, repeats: true)
    }
}
