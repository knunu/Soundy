//
//  IntroductionViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 21..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class IntroductionViewController: UIViewController {

    fileprivate let videoURL: URL = Bundle.main.url(forResource: "introduction_video", withExtension: "mp4")!
    fileprivate var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if player != nil {
            player.pause()
            player = nil
        }
    }
    
    @IBAction func onClickPlayButton(_ sender: UIButton) {
        player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        player.play()
    }
}
