// 
//  StatisticsViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 19/7/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Screen for viewing statistics about all your entries, and also for save and loading entries to a file
class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnLoad: UIButton!
    
    @IBAction func btnSavePressed(_ sender: Any) {
        saveJournalEntries()
    }
    
    @IBAction func btnLoadPressed(_ sender: Any) {
        loadJournalEntries()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
