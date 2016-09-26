//
//  SoundyViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 8..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit

class SoundyViewController: UIViewController {
    fileprivate var preClickedButton: UIButton!
    fileprivate var preImageButtonName = String()
    @IBOutlet weak var defaultClickedButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    fileprivate let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    fileprivate let weekdayList = ["토요일", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일"]
    fileprivate var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setThePresent()
        self.onClickHomeNoiseButton(defaultClickedButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SoundyViewSegue" {
            containerView.removeAllSubviews()
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    lazy var homeNoiseViewController: UINavigationController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "HomeNoiseNavigationController") as! UINavigationController
        
        // Add View Controller as Child View Controller
        self.addViewControllerAsChildViewController(viewController)
        
        return viewController
    }()
    
    lazy var prealarmViewController: PrealarmViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "PrealarmViewController") as! PrealarmViewController
        
        // Add View Controller as Child View Controller
        self.addViewControllerAsChildViewController(viewController)
        
        return viewController
    }()
    
    lazy var introductionViewController: IntroductionViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "IntroductionViewController") as! IntroductionViewController
        
        // Add View Controller as Child View Controller
        self.addViewControllerAsChildViewController(viewController)
        
        return viewController
    }()
    
    @IBAction func onClickHomeButton() {
        self.dismiss(animated: false, completion: nil);
    }
    
    @IBAction func onClickHomeNoiseButton(_ clickedButton: UIButton) {
        titleLabel.text = "우리집 소음"
        handleButtonImage(clickedButton)
        updateChildView(homeNoiseViewController)
    }
    
    @IBAction func onClickPrealarmButton(_ clickedButton: UIButton) {
        titleLabel.text = "소음 미리 공지"
        handleButtonImage(clickedButton)
        updateChildView(prealarmViewController)
    }
    
    @IBAction func onClickIntroductionButton(_ clickedButton: UIButton) {
        titleLabel.text = "사운디 소개"
        handleButtonImage(clickedButton)
        updateChildView(introductionViewController)
    }
    
    fileprivate func updateChildView(_ selectedChildViewController: UIViewController) {
        for childViewController in self.childViewControllers {
            if (childViewController == selectedChildViewController) {
                childViewController.view.isHidden = false
            } else {
                childViewController.view.isHidden = true
            }
        }
    }
    
    fileprivate func addViewControllerAsChildViewController(_ viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: self)
        
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        containerView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = containerView.bounds
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    fileprivate func handleButtonImage(_ clickedButton: UIButton) {
        let curImageButtonName = clickedButton.currentTitle!
        
        if (preClickedButton != nil && preImageButtonName != curImageButtonName) {
            preClickedButton!.setImage(UIImage(named: "\(preImageButtonName)"), for: UIControlState())
        }
        clickedButton.setImage(UIImage(named: "clicked_\(curImageButtonName)"), for: UIControlState())
        preClickedButton = clickedButton
        preImageButtonName = curImageButtonName
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
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.refreshTime), userInfo: nil, repeats: true)
    }
}
