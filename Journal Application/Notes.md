#  Tasks



## To Do
- Set up UIDatePicker in Entry Date Change View
- Implement search for Entry Search View
- Create template new entry view
- Implement saving new journal entry
- Reload UICollectionView on file load
- Set up statistics screen
- 

## In Progress
- !!! Add date property to JournalEntry
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

## TabBar Controller

### Home Nav Controller

#### Home (HomeViewController)

##### Entry View (EntryViewController)

##### Search (EntrySearchViewController)

### New Entry Nav Controller

#### Create New Entry (CreateEntryViewController)

##### New Entry (NewEntryViewController)

##### Entry Date Change (EntryDateChangeViewController)

### Statistics Nav Controller

#### Statistics (StatisticsViewController)
