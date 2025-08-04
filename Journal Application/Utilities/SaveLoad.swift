// 
//  SaveLoad.swift
//  Journal Application
//
//  Created by Thomas Holloway on 29/7/2025
//  Swift 6.0, macOS 15.5

import Foundation

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
            } else {
                return AnyJournalEntry.entry(entry)
            }
        }
        
        let jsonData = try encoder.encode(wrappedEntries)
        try jsonData.write(to: jsonURL, options: .atomic)
        print("Journal entries saved successfully.")
//        print(jsonURL)
    } catch {
        print("Error saving journal entries:", error)
    }
}

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
