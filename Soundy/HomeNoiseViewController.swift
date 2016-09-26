//
//  HomeNoiseViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 17..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit

class HomeNoiseViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    lazy var realTimeViewController: RealTimeViewController = {
        // Load Stroyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "RealTimeViewController") as! RealTimeViewController
    
        // Add View Controller as Child View Controller
        self.addViewControllerAsChildViewController(viewController)
        
        return viewController
    }()
    
    lazy var noiseReportViewController: NoiseReportViewController = {
        // Load Stroyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "NoiseReportViewController") as! NoiseReportViewController
        
        // Add View Controller as Child View Controller
        self.addViewControllerAsChildViewController(viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupView() {
        self.setupSegmentedControl()
        self.updateView()
    }
    
    // It can be implemented by using controller parameter
    fileprivate func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            realTimeViewController.view.isHidden = false
            noiseReportViewController.view.isHidden = true
            realTimeViewController.animateView()
        } else {
            realTimeViewController.view.isHidden = true
            noiseReportViewController.view.isHidden = false
            noiseReportViewController.animateView()
        }
    }
    
    @objc fileprivate func selectionDidchange(_ sender: UISegmentedControl) {
        self.updateView()
    }
    
    fileprivate func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(selectionDidchange(_:)), for: .valueChanged)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    fileprivate func addViewControllerAsChildViewController(_ viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: self)
        
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
//        viewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
}
