//
//  RealTimeViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 17..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit

class RealTimeViewController: UIViewController {
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
            UIImage(named: "real_time_noise_00000")!,
            UIImage(named: "real_time_noise_00001")!,
            UIImage(named: "real_time_noise_00002")!,
            UIImage(named: "real_time_noise_00003")!,
            UIImage(named: "real_time_noise_00004")!,
            UIImage(named: "real_time_noise_00005")!,
            UIImage(named: "real_time_noise_00006")!,
            UIImage(named: "real_time_noise_00007")!,
            UIImage(named: "real_time_noise_00008")!,
            UIImage(named: "real_time_noise_00009")!,
            UIImage(named: "real_time_noise_00010")!,
            UIImage(named: "real_time_noise_00011")!,
            UIImage(named: "real_time_noise_00012")!,
            UIImage(named: "real_time_noise_00013")!,
            UIImage(named: "real_time_noise_00014")!,
            UIImage(named: "real_time_noise_00015")!,
            UIImage(named: "real_time_noise_00016")!,
            UIImage(named: "real_time_noise_00017")!,
            UIImage(named: "real_time_noise_00018")!,
            UIImage(named: "real_time_noise_00019")!,
            UIImage(named: "real_time_noise_00020")!,
            UIImage(named: "real_time_noise_00021")!,
            UIImage(named: "real_time_noise_00022")!,
            UIImage(named: "real_time_noise_00023")!,
            UIImage(named: "real_time_noise_00024")!,
            UIImage(named: "real_time_noise_00025")!,
            UIImage(named: "real_time_noise_00026")!,
            UIImage(named: "real_time_noise_00027")!,
            UIImage(named: "real_time_noise_00028")!,
            UIImage(named: "real_time_noise_00029")!,
            UIImage(named: "real_time_noise_00030")!,
            UIImage(named: "real_time_noise_00031")!,
            UIImage(named: "real_time_noise_00032")!,
            UIImage(named: "real_time_noise_00033")!,
            UIImage(named: "real_time_noise_00034")!,
            UIImage(named: "real_time_noise_00035")!,
            UIImage(named: "real_time_noise_00036")!,
            UIImage(named: "real_time_noise_00037")!,
            UIImage(named: "real_time_noise_00038")!,
            UIImage(named: "real_time_noise_00039")!,
            UIImage(named: "real_time_noise_00040")!,
            UIImage(named: "real_time_noise_00041")!,
            UIImage(named: "real_time_noise_00042")!,
            UIImage(named: "real_time_noise_00043")!,
            UIImage(named: "real_time_noise_00044")!,
            UIImage(named: "real_time_noise_00045")!,
            UIImage(named: "real_time_noise_00046")!,
            UIImage(named: "real_time_noise_00047")!,
            UIImage(named: "real_time_noise_00048")!,
            UIImage(named: "real_time_noise_00049")!,
            UIImage(named: "real_time_noise_00050")!,
            UIImage(named: "real_time_noise_00051")!,
            UIImage(named: "real_time_noise_00052")!,
            UIImage(named: "real_time_noise_00053")!,
            UIImage(named: "real_time_noise_00054")!,
            UIImage(named: "real_time_noise_00055")!,
            UIImage(named: "real_time_noise_00056")!,
            UIImage(named: "real_time_noise_00057")!,
            UIImage(named: "real_time_noise_00058")!,
            UIImage(named: "real_time_noise_00059")!,
            UIImage(named: "real_time_noise_00060")!,
            UIImage(named: "real_time_noise_00061")!,
            UIImage(named: "real_time_noise_00062")!,
            UIImage(named: "real_time_noise_00063")!,
            UIImage(named: "real_time_noise_00064")!,
            UIImage(named: "real_time_noise_00065")!,
            UIImage(named: "real_time_noise_00066")!,
            UIImage(named: "real_time_noise_00067")!,
            UIImage(named: "real_time_noise_00068")!,
            UIImage(named: "real_time_noise_00069")!,
            UIImage(named: "real_time_noise_00070")!,
            UIImage(named: "real_time_noise_00071")!,
            UIImage(named: "real_time_noise_00072")!,
            UIImage(named: "real_time_noise_00073")!,
            UIImage(named: "real_time_noise_00074")!,
            UIImage(named: "real_time_noise_00075")!,
            UIImage(named: "real_time_noise_00076")!,
            UIImage(named: "real_time_noise_00077")!,
            UIImage(named: "real_time_noise_00078")!,
            UIImage(named: "real_time_noise_00079")!,
            UIImage(named: "real_time_noise_00080")!,
            UIImage(named: "real_time_noise_00081")!,
            UIImage(named: "real_time_noise_00082")!,
            UIImage(named: "real_time_noise_00083")!,
            UIImage(named: "real_time_noise_00084")!,
            UIImage(named: "real_time_noise_00085")!,
            UIImage(named: "real_time_noise_00086")!,
            UIImage(named: "real_time_noise_00087")!,
            UIImage(named: "real_time_noise_00088")!,
            UIImage(named: "real_time_noise_00089")!,
            UIImage(named: "real_time_noise_00090")!,
            UIImage(named: "real_time_noise_00091")!,
            UIImage(named: "real_time_noise_00092")!,
            UIImage(named: "real_time_noise_00093")!,
            UIImage(named: "real_time_noise_00094")!,
            UIImage(named: "real_time_noise_00095")!,
            UIImage(named: "real_time_noise_00096")!,
            UIImage(named: "real_time_noise_00097")!,
            UIImage(named: "real_time_noise_00098")!,
            UIImage(named: "real_time_noise_00099")!,
            UIImage(named: "real_time_noise_00100")!,
            UIImage(named: "real_time_noise_00101")!,
            UIImage(named: "real_time_noise_00102")!,
            UIImage(named: "real_time_noise_00103")!,
            UIImage(named: "real_time_noise_00104")!,
            UIImage(named: "real_time_noise_00105")!,
            UIImage(named: "real_time_noise_00106")!,
            UIImage(named: "real_time_noise_00107")!,
            UIImage(named: "real_time_noise_00108")!,
            UIImage(named: "real_time_noise_00109")!,
            UIImage(named: "real_time_noise_00110")!,
            UIImage(named: "real_time_noise_00111")!,
            UIImage(named: "real_time_noise_00112")!,
            UIImage(named: "real_time_noise_00113")!,
            UIImage(named: "real_time_noise_00114")!,
            UIImage(named: "real_time_noise_00115")!,
            UIImage(named: "real_time_noise_00116")!,
            UIImage(named: "real_time_noise_00117")!,
            UIImage(named: "real_time_noise_00118")!,
            UIImage(named: "real_time_noise_00119")!,
            UIImage(named: "real_time_noise_00120")!,
            UIImage(named: "real_time_noise_00121")!,
            UIImage(named: "real_time_noise_00122")!,
            UIImage(named: "real_time_noise_00123")!,
            UIImage(named: "real_time_noise_00124")!,
            UIImage(named: "real_time_noise_00125")!,
            UIImage(named: "real_time_noise_00126")!,
            UIImage(named: "real_time_noise_00127")!,
            UIImage(named: "real_time_noise_00128")!,
            UIImage(named: "real_time_noise_00129")!,
            UIImage(named: "real_time_noise_00130")!,
            UIImage(named: "real_time_noise_00131")!,
            UIImage(named: "real_time_noise_00132")!,
            UIImage(named: "real_time_noise_00133")!,
            UIImage(named: "real_time_noise_00134")!,
            UIImage(named: "real_time_noise_00135")!,
            UIImage(named: "real_time_noise_00136")!,
            UIImage(named: "real_time_noise_00137")!,
            UIImage(named: "real_time_noise_00138")!,
            UIImage(named: "real_time_noise_00139")!,
            UIImage(named: "real_time_noise_00140")!,
            UIImage(named: "real_time_noise_00141")!,
            UIImage(named: "real_time_noise_00142")!,
            UIImage(named: "real_time_noise_00143")!
        ]
        pngSequenceView.animationDuration = 3
        pngSequenceView.animationRepeatCount = 1
    }
    
    func animateView() {
        pngSequenceView.startAnimating()
    }
}
