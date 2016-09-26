//
//  CameraViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 10..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    fileprivate let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    fileprivate let weekdayList = ["토요일", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일"]
    fileprivate let captureSession = AVCaptureSession()
    
    fileprivate var timer = Timer()
    fileprivate var captureDevice : AVCaptureDevice?
    fileprivate var previewLayer : AVCaptureVideoPreviewLayer?
    fileprivate var previewLayerConnection : AVCaptureConnection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "현관 카메라"
        self.setThePresent()
        self.setTheCamera()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate : Bool {
        return false
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let screenSize = self.view.bounds.size
//        
//        if let touchPoint = touches.first {
//            let x = touchPoint.locationInView(self.view).y / screenSize.height
//            let y = 1.0 - touchPoint.locationInView(self.view).x / screenSize.width
//            let focusPoint = CGPoint(x: x, y: y)
//            
//            if let device = captureDevice {
//                do {
//                    try device.lockForConfiguration()
//                    
//                    device.focusPointOfInterest = focusPoint
//                    device.focusMode = .AutoFocus
//                    device.exposurePointOfInterest = focusPoint
//                    device.exposureMode = AVCaptureExposureMode.ContinuousAutoExposure
//                    device.unlockForConfiguration()
//                } catch let error as NSError {
//                    print(error.code)
//                }
//            }
//        }
//    }
    
    @IBAction func onClickHomeButton() {
        self.dismiss(animated: false, completion: nil);
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
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(CameraViewController.refreshTime), userInfo: nil, repeats: true)
    }
    
    fileprivate func setTheCamera() {
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        let devices = AVCaptureDevice.devices()
        
        for device in devices! {
            if ((device as AnyObject).hasMediaType(AVMediaTypeVideo)) {
                if ((device as AnyObject).position == AVCaptureDevicePosition.front) {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        beginCameraSession()
                    }
                }
            }
        }
    }
    
    fileprivate func beginCameraSession() {
        if let device = captureDevice {
            do {
                try device.lockForConfiguration()
                try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
            } catch let error as NSError {
                print(error.code)
            }
//            device.focusMode = .Locked
            device.unlockForConfiguration()
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayerConnection = previewLayer!.connection
        if ((previewLayerConnection?.isVideoOrientationSupported) != nil) {
            let deviceOrientation = UIDevice.current.orientation
            
            switch (deviceOrientation) {
            case .landscapeLeft:
                previewLayerConnection?.videoOrientation = AVCaptureVideoOrientation.landscapeRight
            case .landscapeRight:
                previewLayerConnection?.videoOrientation = AVCaptureVideoOrientation.landscapeLeft
            default:
                previewLayerConnection?.videoOrientation = AVCaptureVideoOrientation.landscapeRight
            }
        }
        self.view.layer.addSublayer(previewLayer!)
        previewLayer!.frame = CGRect(x: 0.0, y: 120.0, width: 1024.0, height: 530.0)
        captureSession.startRunning()
    }
}
