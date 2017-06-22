t//
//  ViewController.swift
//  Flow
//
//  Created by Kaypree Hodges on 5/15/17.
//  Copyright © 2017 Kaypree Hodges. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    
    @IBOutlet weak var calendar: JTAppleCalendarView!
    
    let formatter = DateFormatter()
    let tropicBlue = UIColor(red: 43, green: 189, blue: 193, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()
        
    }

    func setupCalendarView() {
        calendar.minimumLineSpacing = 0
        calendar.minimumInteritemSpacing = 0
    }
    
    func handleSelectedCell(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? DateCell else { return }

        if cellState.isSelected {
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
        }
    }
    
    func handleTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? DateCell else { return }
        
        if cellState.isSelected {
            cell.dateCellLabel.textColor = .white
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                cell.dateCellLabel.textColor = .white
            } else {
                cell.dateCellLabel.textColor = .darkGray
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: JTAppleCalendarViewDataSource {
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")
        let endDate = formatter.date(from: "2017 12 31")

//        guard let uwStartDate = startDate else { return }
//        guard let uwEndDate = endDate else { return }
        // TODO: - Handle unwrapping the dates safely
        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    

}

extension ViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        cell.dateCellLabel.text = cellState.text
        
        handleSelectedCell(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleSelectedCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleSelectedCell(view: cell, cellState: cellState)
    }
    
    
}












