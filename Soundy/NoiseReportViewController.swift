//
//  NoiseReportViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 17..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit

class NoiseReportViewController: UIViewController {
    @IBOutlet weak var pngSequenceView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAnimatedView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setAnimatedView() {
        pngSequenceView.animationImages = [
            UIImage(named: "noise_report_00000")!,
            UIImage(named: "noise_report_00001")!,
            UIImage(named: "noise_report_00002")!,
            UIImage(named: "noise_report_00003")!,
            UIImage(named: "noise_report_00004")!,
            UIImage(named: "noise_report_00005")!,
            UIImage(named: "noise_report_00006")!,
            UIImage(named: "noise_report_00007")!,
            UIImage(named: "noise_report_00008")!,
            UIImage(named: "noise_report_00009")!,
            UIImage(named: "noise_report_00010")!,
            UIImage(named: "noise_report_00011")!,
            UIImage(named: "noise_report_00012")!,
            UIImage(named: "noise_report_00013")!,
            UIImage(named: "noise_report_00014")!,
            UIImage(named: "noise_report_00015")!,
            UIImage(named: "noise_report_00016")!,
            UIImage(named: "noise_report_00017")!,
            UIImage(named: "noise_report_00018")!,
            UIImage(named: "noise_report_00019")!,
            UIImage(named: "noise_report_00020")!,
            UIImage(named: "noise_report_00021")!,
            UIImage(named: "noise_report_00022")!,
            UIImage(named: "noise_report_00023")!,
            UIImage(named: "noise_report_00024")!,
            UIImage(named: "noise_report_00025")!,
            UIImage(named: "noise_report_00026")!,
            UIImage(named: "noise_report_00027")!,
            UIImage(named: "noise_report_00028")!,
            UIImage(named: "noise_report_00029")!,
            UIImage(named: "noise_report_00030")!,
            UIImage(named: "noise_report_00031")!,
            UIImage(named: "noise_report_00032")!,
            UIImage(named: "noise_report_00033")!,
            UIImage(named: "noise_report_00034")!,
            UIImage(named: "noise_report_00035")!,
            UIImage(named: "noise_report_00036")!,
            UIImage(named: "noise_report_00037")!,
            UIImage(named: "noise_report_00038")!,
            UIImage(named: "noise_report_00039")!,
            UIImage(named: "noise_report_00040")!,
            UIImage(named: "noise_report_00041")!,
            UIImage(named: "noise_report_00042")!,
            UIImage(named: "noise_report_00043")!,
            UIImage(named: "noise_report_00044")!,
            UIImage(named: "noise_report_00045")!,
            UIImage(named: "noise_report_00046")!,
            UIImage(named: "noise_report_00047")!,
            UIImage(named: "noise_report_00048")!,
            UIImage(named: "noise_report_00049")!,
            UIImage(named: "noise_report_00050")!,
            UIImage(named: "noise_report_00051")!,
            UIImage(named: "noise_report_00052")!,
            UIImage(named: "noise_report_00053")!,
            UIImage(named: "noise_report_00054")!,
            UIImage(named: "noise_report_00055")!,
            UIImage(named: "noise_report_00056")!,
            UIImage(named: "noise_report_00057")!,
            UIImage(named: "noise_report_00058")!,
            UIImage(named: "noise_report_00059")!,
            UIImage(named: "noise_report_00060")!,
            UIImage(named: "noise_report_00061")!,
            UIImage(named: "noise_report_00062")!,
            UIImage(named: "noise_report_00063")!,
            UIImage(named: "noise_report_00064")!,
            UIImage(named: "noise_report_00065")!,
            UIImage(named: "noise_report_00066")!,
            UIImage(named: "noise_report_00067")!,
            UIImage(named: "noise_report_00068")!,
            UIImage(named: "noise_report_00069")!,
            UIImage(named: "noise_report_00070")!,
            UIImage(named: "noise_report_00071")!,
            UIImage(named: "noise_report_00072")!,
            UIImage(named: "noise_report_00073")!,
            UIImage(named: "noise_report_00074")!,
            UIImage(named: "noise_report_00075")!,
            UIImage(named: "noise_report_00076")!,
            UIImage(named: "noise_report_00077")!,
            UIImage(named: "noise_report_00078")!,
            UIImage(named: "noise_report_00079")!,
            UIImage(named: "noise_report_00080")!,
            UIImage(named: "noise_report_00081")!,
            UIImage(named: "noise_report_00082")!
        ]
        pngSequenceView.animationDuration = 3
        pngSequenceView.animationRepeatCount = 1
    }
    
    func animateView() {
        pngSequenceView.startAnimating()
    }
}
