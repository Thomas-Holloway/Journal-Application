//
//  AnyJournalEntry.swift
//  Journal Application
//
//  Created by Thomas Holloway on 4/8/2025
//  Swift 6.0, macOS 15.5

enum AnyJournalEntry: Codable {
    case entry(JournalEntry)
    case weekReview(WeekReview)
    case monthReview(MonthReview)
    case yearReview(YearReview)
    
    enum CodingKeys: String, CodingKey {
        case type
        case entry
    }
    
    enum EntryType: String, Codable {
        case entry
        case weekReview
        case monthReview
        case yearReview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(EntryType.self, forKey: .type)
        
        switch type {
        case .entry:
            let entry = try container.decode(JournalEntry.self, forKey: .entry)
            self = .entry(entry)
        case .weekReview:
            let review = try container.decode(WeekReview.self, forKey: .entry)
            self = .weekReview(review)
        case .monthReview:
            let review = try container.decode(MonthReview.self, forKey: .entry)
            self = .monthReview(review)
        case .yearReview:
            let review = try container.decode(YearReview.self, forKey: .entry)
            self = .yearReview(review)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .entry(let entry):
            try container.encode(EntryType.entry, forKey: .type)
            try container.encode(entry, forKey: .entry)
        case .weekReview(let review):
            try container.encode(EntryType.weekReview, forKey: .type)
            try container.encode(review, forKey: .entry)
        case .monthReview(let review):
            try container.encode(EntryType.monthReview, forKey: .type)
            try container.encode(review, forKey: .entry)
        case .yearReview(let review):
            try container.encode(EntryType.yearReview, forKey: .type)
            try container.encode(review, forKey: .entry)
        }
    }
    
    // For easy access back to base class
    var base: JournalEntry {
        switch self {
        case .entry(let e): return e
        case .weekReview(let w): return w
        case .monthReview(let m): return m
        case .yearReview(let y): return y
        }
    }
}

