#  Tasks



## To Do
-  


## In Progress
- 


## Completed
- 


- - -

Validation
- Existence check
- Type check
- Range check

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

- - -

# Views
TabBar Controller
├── Navigation Controller
│   └── Home
│       ├── Entry View
│       └── Search
├── Navigation Controller
│   └── Create New Entry
│       └── New Entry
│           └── Entry Date Change
└── Navigation Controller
    └── Statistics

## TabBar Controller

### Navigation Controller

#### Home (HomeViewController)

##### Entry View (EntryViewController)

##### Search (EntrySearchViewController)

### Navigation Controller

#### Create New Entry (CreateEntryViewController)

##### New Entry (NewEntryViewController)

##### Entry Date Change (EntryDateChangeViewController)

### Navigation Controller

#### Statistics (StatisticsViewController)
