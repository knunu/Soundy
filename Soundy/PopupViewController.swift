//
//  popupViewController.swift
//  Soundy
//
//  Created by Kim Seonu on 2016. 9. 13..
//  Copyright © 2016년 Knunu. All rights reserved.
//

import UIKit
import DLRadioButton
import CVCalendar

protocol scheduleProtocol {
    func addSchedule(month: String, day: String, title: String)
}

class PopupViewController: UIViewController {
    struct Color {
        static let selectedText = UIColor.white
        static let text = UIColor.black
        static let textDisabled = UIColor.gray
        static let selectionBackground = UIColor.colorFromCode(0x6ABBCE)
        static let sundayText = UIColor(red: 1.0, green: 0.2, blue: 0.2, alpha: 1.0)
        static let sundayTextDisabled = UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0)
        static let sundaySelectionBackground = sundayText
    }
    @IBOutlet weak var timeButton: DLRadioButton!
    @IBOutlet weak var reasonButton: DLRadioButton!
    @IBOutlet weak var addScheduleView: UIView!
    @IBOutlet weak var calendarContainerView: UIView!
    @IBOutlet weak var calendarMenuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateField: UILabel!
    
    fileprivate var selectedDay: DayView!
    fileprivate var selectedReason: String!
    var delegate: scheduleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarContainerView.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarMenuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
}

// MARK: - CVCalendarViewDelegate & CVCalendarMenuViewDelegate

extension PopupViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .sunday
    }
    
    // MARK: Optional methods
    
    func shouldSelectDayView(_ dayView: DayView) -> Bool {
        return true
    }
    func dayOfWeekFont() -> UIFont {
        return UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {
        return weekday == .sunday ? UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0) : UIColor.black
    }
    
    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool) {
        selectedDay = dayView
        print("selected day : \(selectedDay.date.commonDescription)")
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        if monthLabel.text != "\(date.month)월" {
            monthLabel.text = "\(date.month)월"
        }
    }
}

// MARK: - CVCalendarViewAppearanceDelegate

extension PopupViewController: CVCalendarViewAppearanceDelegate {
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_, .selected, _), (_, .highlighted, _): return Color.selectedText
        case (.sunday, .in, _): return Color.sundayText
        case (.sunday, _, _): return Color.sundayTextDisabled
        case (_, .in, _): return Color.text
        default: return Color.textDisabled
        }
    }
    
    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (.sunday, .selected, _), (.sunday, .highlighted, _): return Color.sundaySelectionBackground
        case (_, .selected, _), (_, .highlighted, _): return Color.selectionBackground
        default: return nil
        }
    }
}

// MARK: - IB Actions

extension PopupViewController {
    @IBAction func onClickClosePopup() {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func onClickCalendarButton() {
        monthLabel.text = "\(CVDate(date: Date()).month)월"
        calendarContainerView.isHidden = false
    }
    
    @IBAction func onClickAddButton() {
        delegate?.addSchedule(month: DateFormatter().shortMonthSymbols[selectedDay.date.month - 1], day: "\(selectedDay.date.day)", title: selectedReason)
        self.dismiss(animated: true, completion: nil)
        // 공사일 경우 별도의 이미지 팝업을 띄워야 함
    }
    
    @IBAction func onClickPrevMonthButton() {
        calendarView.loadPreviousView()
    }
    
    @IBAction func onClickNextMonthButton() {
        calendarView.loadNextView()
    }
    
    @IBAction func onClickOkButton() {
        if selectedDay != nil {
            let year = "\(selectedDay.date.year)"
            let month = selectedDay.date.month
            let day = selectedDay.date.day
            dateField.text = "\(year.substring(from: year.index(year.endIndex, offsetBy: -2))).\(month).\(day)"
        }
        calendarContainerView.isHidden = true
    }
    
    @IBAction func onClickTimeButton(_ sender: DLRadioButton) {
        print("\(sender.selected()!.titleLabel!.text!)")
    }
    
    @IBAction func onClickReasonButton(_ sender: DLRadioButton) {
        selectedReason = sender.selected()!.titleLabel!.text!
        print("\(sender.selected()!.titleLabel!.text!)")
    }
}
