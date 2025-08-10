// 
//  JournalEntry.swift
//  Journal Application
//
//  Created by Thomas Holloway on 21/7/2025
//  Swift 6.0, macOS 15.5

import Foundation

/**
 A class representing a journal entry.

 Stores the title, content, and dates for each journal entry.
 
 - Parameters:
    - title: The title of the journal entry.
    - content: The text content of the journal entry.
    - date: The date this entry is for.
    - dateCreated: The date this entry was created.
- Note: `dateCreated` is automatically set to the current date when creating a new entry.
 */
class JournalEntry: Codable {
    var title: String
    var content: String
    var date: Date /* Date entry is being made for */
    var dateCreated: Date /* Date the entry was made */
    
/**
 Creates a new journal entry
 - Parameters:
    - title: The title of the journal entry.
    - content: The text content of the journal entry.
    - date: The date this entry is for.
    - dateCreated: The date this entry was created.
*/
    init(title: String, content: String, date: Date, dateCreated: Date) {
        self.title = title
        self.content = content
        self.date = date
        self.dateCreated = dateCreated
    }
}

/// journalEntries array is used to store all journal entries
var journalEntries: [JournalEntry] = []
