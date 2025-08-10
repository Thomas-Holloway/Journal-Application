#  Tasks

All tasks to work on for this project

## To Do
- 

## In Progress
- 

## Completed
- Implement saving new journal entry
- !!! Add date property to JournalEntry
- Set up UIDatePicker in Entry Date Change View
- Implement search for Entry Search View
- Set up statistics screen
- Pass date from EntryDateChangeViewController to NewEntryViewController
- Internal Documentation

- - -

# Classes

- All classes used in this project, along with their properties and methods/procdure

## JourneyEntry: Codable
    var title: String
    var content: String
    var date: Date
    var dateCreated: Date

### WeekReview: JournalEntry
    var week: Int
    var year: Int

### MonthReview: JournalEntry
    var month: Int
    var year: Int

### YearlyReview: JournalEntry
    var year: Int

## HomeCollectionViewCell: UICollectionViewCell
    

- - -

# Views
TabBar Controller
├── Home Nav Controller
│   └── Home
│       ├── Entry View
│       └── Search
├── New Entry Nav Controller
│   └── Create New Entry
│       └── New Entry
│           └── Entry Date Change
└── Statistics Nav Controller
    └── Statistics
