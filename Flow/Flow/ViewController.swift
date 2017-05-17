//
//  ViewController.swift
//  Flow
//
//  Created by Kaypree Hodges on 5/15/17.
//  Copyright © 2017 Kaypree Hodges. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")
        let endDate = formatter.date(from: "2017 12 31")

//        guard let uwStartDate = startDate else { return }
//        guard let uwEndDate = endDate else { return }
        // TODO: - Handle unwraping the dates
        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        cell.dateCellLabel.text = cellState.text
        return cell
    }
    
}
