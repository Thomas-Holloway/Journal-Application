// 
//  EntryDateChangeViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 5/8/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

///
class EntryDateChangeViewController: UIViewController {
    
    weak var delegate: EntryDateChangeViewControllerDelegate?
    var entryIndex: Int?
    
    @IBOutlet weak var dpkChangeDate: UIDatePicker!
    var newDate: Date = Date()
    
    /// Runs when the date selected in the date picker is changed
    @IBAction func dpkValueChanged(_ sender: UIDatePicker) {
        newDate = sender.date
        print("Picked date:", newDate.ISO8601Format())
    }
    
    /// Runs when the current screen is going to be left
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            delegate?.didChangeEntryDate(to: newDate)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dpkChangeDate.date = Date() // now
        dpkChangeDate.maximumDate = Date()
    }
}

// MARK: - Protocol to send the date change back
protocol EntryDateChangeViewControllerDelegate: AnyObject {
    func didChangeEntryDate(to newDate: Date)
}
