//
//  WeekReview.swift
//  Journal Application
//
//  Created by Thomas Holloway on 1/8/2025
//  Swift 6.0, macOS 15.5

import Foundation

/**
 A class representing a weekly review entry.
 
 Inherits from the JournalEntry class
 
 - Parameters:
    - week: The number of the week the review is created for
    - year: The year the review is created for
 */
class WeekReview: JournalEntry {
    var week: Int
    var year: Int
    
    init(title: String, content: String, date: Date, dateCreated: Date, week: Int, year: Int) {
        self.week = week
        self.year = year
        super.init(title: title, content: content, date: date, dateCreated: dateCreated)
    }
    
    //MARK: Decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.week = try container.decode(Int.self, forKey: .week)
        self.year = try container.decode(Int.self, forKey: .year)
        try super.init(from: decoder)
    }
    
    //MARK: Encoding
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(week, forKey: .week)
        try container.encode(year, forKey: .year)
    }
    
    //MARK: Coding Keys
    private enum CodingKeys: String, CodingKey {
        case week
        case year
    }
    
}
