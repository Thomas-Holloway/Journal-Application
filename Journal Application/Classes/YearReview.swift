//
//  YearReview.swift
//  Journal Application
//
//  Created by Thomas Holloway on 1/8/2025
//  Swift 6.0, macOS 15.5

import Foundation

/**
 A class representing a yearly review entry.
 
 Inherits from the JournalEntry class
 
 - Parameters:
    - year: The year the review is created for
 */
class YearReview: JournalEntry {
    var year: Int
    
    init(title: String, content: String, date: Date, dateCreated: Date, year: Int) {
        self.year = year
        super.init(title: title, content: content, date: date, dateCreated: dateCreated)
    }
    
    //MARK: Decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.year = try container.decode(Int.self, forKey: .year)
        try super.init(from: decoder)
    }
    
    //MARK: Encoding
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(year, forKey: .year)
    }
    
    //MARK: Coding Keys
    private enum CodingKeys: String, CodingKey {
        case year
    }
    
}


