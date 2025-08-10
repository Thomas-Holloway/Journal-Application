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
    
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var lblEntries: UILabel!
    @IBOutlet weak var lblTotalWords: UILabel!
    @IBOutlet weak var lblAvgWords: UILabel!
    
    // Saves all entries to a file
    @IBAction func btnSavePressed(_ sender: Any) {
        saveJournalEntries()
    }
    
    // Loads all entries from a file
    @IBAction func btnLoadPressed(_ sender: Any) {
        loadJournalEntries()
    }
    
    /// Function to get the total word count (of the content) across all entries
    func getTotalWordCount() -> Int {
        let totalWordCount = journalEntries.reduce(0) { partialResult, entry in
            let words = entry.content.split { !$0.isLetter && !$0.isNumber }
            return partialResult + words.count
        }
        return totalWordCount
    }
    
    /// Function to get the average word count (of the content) across all entries
    func getAverageWordCount() -> Double {
        let totalWords = getTotalWordCount()
        guard !journalEntries.isEmpty else { return 0 }
        return Double(totalWords) / Double(journalEntries.count)
    }
    
    /// Function to get the number of days with journal entries
    func getDaysJournaled() -> Int {
        let calendar = Calendar.current
        let uniqueDays = Set(journalEntries.map { entry in
            calendar.startOfDay(for: entry.date)
        })
        return uniqueDays.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Sets the statistics text when the view will appear, enabling automatic updating
    override func viewWillAppear(_ animated: Bool) {
        lblDays.text = "\(getDaysJournaled())"
        lblEntries.text = "\(journalEntries.count)"
        lblTotalWords.text = "\(getTotalWordCount())"
        lblAvgWords.text = "\(Int(getAverageWordCount()))"
    }
    
}

