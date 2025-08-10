// 
//  SaveLoad.swift
//  Journal Application
//
//  Created by Thomas Holloway on 29/7/2025
//  Swift 6.0, macOS 15.5

import Foundation

/// Save all journal entries to a file
func saveJournalEntries() {
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let jsonURL = directoryURL.appendingPathComponent("journal_entries.json")
    
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        // Convert to wrapper array
        let wrappedEntries = journalEntries.map { entry in
            if let yearReview = entry as? YearReview {
                return AnyJournalEntry.yearReview(yearReview)
            } else if let monthReview = entry as? MonthReview {
                return AnyJournalEntry.monthReview(monthReview)
            } else if let weekReview = entry as? WeekReview {
                return AnyJournalEntry.weekReview(weekReview)
            } else {
                return AnyJournalEntry.entry(entry)
            }
        }
        
        let jsonData = try encoder.encode(wrappedEntries)
        try jsonData.write(to: jsonURL, options: .atomic)
        print("Journal entries saved successfully.")
    } catch {
        print("Error saving journal entries:", error)
    }
}

/// Load all journal entries from a file
func loadJournalEntries() {
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let jsonURL = directoryURL.appendingPathComponent("journal_entries.json")
    
    do {
        let decoder = JSONDecoder()
        let jsonData = try Data(contentsOf: jsonURL)
        
        let wrappedEntries = try decoder.decode([AnyJournalEntry].self, from: jsonData)
        journalEntries = wrappedEntries.map { $0.base }
        
        print("Journal entries loaded successfully.")
    } catch {
        print("Error loading journal entries:", error)
    }
}
