// 
//  JournalEntry.swift
//  Journal Application
//
//  Created by Thomas Holloway on 21/7/2025
//  Swift 6.0, macOS 15.5

import Foundation

/// <#Description#>
class JournalEntry: Codable {
    var title: String
    var content: String
// TODO: Figure out how to implement Date
    var date: Date /* Date entry is being made for */
    var dateCreated: Date /* Date the entry was made */
    
    init(title: String, content: String, date: Date, dateCreated: Date) {
        self.title = title
        self.content = content
        self.date = date
        self.dateCreated = dateCreated
    }
}

var journalEntries: [JournalEntry] = []
