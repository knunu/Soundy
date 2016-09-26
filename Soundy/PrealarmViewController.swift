//
//  PreAlarmViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 13..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit

class PrealarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate, scheduleProtocol {
    @IBOutlet var imageButtons: [UIButton]!
    @IBOutlet var popupImageButtons: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var constructionPopupView: UIView!
    fileprivate var popupView: UIView!
    
    var cellMonth = ["9월", "9월", "9월", "9월", "9월", "9월"]
    var cellDay = ["1", "7", "13", "15", "21", "25"]
    var cellTitle = ["공사", "모임", "모임", "아이동반 모임", "아이동반 모임", "이사"]
    var cellCount = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defaultSetPopup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickAddScheduleButton() {
        let popupViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        
        popupViewController.delegate = self
        popupViewController.modalPresentationStyle = .popover
        
        let popover = popupViewController.popoverPresentationController
        popover?.backgroundColor = UIColor.clear
        popover?.delegate = self
        popover?.sourceView = self.view
        popover?.permittedArrowDirections = []
        popover?.sourceRect = CGRect(x: 460, y: 300, width: 0, height: 0)
        self.present(popupViewController, animated: false, completion: nil)
    }
    
    @IBAction func onClickImageButton(_ sender: UIButton) {
        for popupImageButton in popupImageButtons {
            if (popupImageButton.currentTitle! == "\(sender.currentTitle!)_popup") {
                popupImageButton.isHidden = false
            }
        }
    }
    
    @IBAction func onClickPopupImageButton(_ sender: UIButton) {
        sender.isHidden = true
    }
    
    @IBAction func onClickConstructionPopupOkButton() {
        constructionPopupView.isHidden = true
    }
    
    fileprivate func defaultSetPopup() {
        for popupImageButton in popupImageButtons {
            popupImageButton.isHidden = true
        }
        constructionPopupView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            cellMonth.remove(at: (indexPath as NSIndexPath).row)
            cellDay.remove(at: (indexPath as NSIndexPath).row)
            cellTitle.remove(at: (indexPath as NSIndexPath).row)
            cellCount -= 1
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScheduleCell
        self.tableView.allowsSelection = false
        
        cell.backgroundColor = UIColor.clear
        cell.month.text = cellMonth[(indexPath as NSIndexPath).row]
        cell.day.text = cellDay[(indexPath as NSIndexPath).row]
        cell.title.text = cellTitle[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func addSchedule(month: String, day: String, title: String) {
        if title == "공사" {
            constructionPopupView.isHidden = false
        }
        cellMonth.append(month)
        cellDay.append(day)
        cellTitle.append(title)
        cellCount += 1
        tableView.reloadData()
    }
}
