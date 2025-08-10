// 
//  HomeViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 19/7/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Main page, contains a UICollectionView, which displays all journal entries made
class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, EntryViewControllerDelegate {
    
    /// Collection View to display the journal entries
    @IBOutlet weak var cvwEntries: UICollectionView!
    
    /// Button to search through journal entries
    @IBOutlet weak var btnSearch: UIButton!
    
    // MARK: Testing Data
    let entry1 = JournalEntry(
        title: "Morning Ride by the River",
        content: "Woke up early and went for a bike ride along the Yarra. The air was crisp, and there was barely anyone around. Saw a pelican diving for fish near the bridge — absolutely majestic.",
        date: Date.now,
        dateCreated: Date.now
    )
    
    let entry2 = JournalEntry(
        title: "Long Study Session",
        content: "Spent most of the afternoon revising chemistry notes. Struggled a bit with the redox equations, but I think I’m starting to get the hang of them. Rewarded myself with a hot chocolate afterwards.",
        date: Date.now.addingTimeInterval(-86400), // yesterday
        dateCreated: Date.now.addingTimeInterval(-86400)
    )
    
    let entry3 = JournalEntry(
        title: "Rainy Day Reflections",
        content: "It rained all day, so I stayed inside. Ended up reorganising my photography library. Found a few shots from last year’s trip that I’d completely forgotten about.",
        date: Date.now.addingTimeInterval(-2 * 86400),
        dateCreated: Date.now.addingTimeInterval(-2 * 86400)
    )
    
    let entry4 = WeekReview(
        title: "Week in Review – Week 32",
        content: "A productive week overall. Managed to stick to my study schedule, and even got out for a ride twice despite the rain. Photography editing backlog is shrinking, slowly but surely.",
        date: Date.now,
        dateCreated: Date.now,
        week: 32,
        year: 2025
    )
    
    let entry5 = MonthReview(
        title: "August Review",
        content: "August was a whirlwind. Lots of schoolwork, but I kept up with it. Discovered a few new cycling routes and experimented more with Lightroom editing techniques. Need to improve sleep schedule next month.",
        date: Date.now,
        dateCreated: Date.now,
        month: 8,
        year: 2025
    )
    
    let entry6 = YearReview(
        title: "2025 Year Review",
        content: "This year has been full of learning — academically and personally. Improved my photography skills, stayed consistent with cycling, and made decent progress with Swift development. Could work on balancing work and downtime better in 2026.",
        date: Date.now,
        dateCreated: Date.now,
        year: 2025
    )
    
// MARK: override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//    Add testing data to the array
        journalEntries.append(entry1)
        journalEntries.append(entry2)
        journalEntries.append(entry3)
        journalEntries.append(entry4)
        journalEntries.append(entry5)
        journalEntries.append(entry6)
        
//    Update the UICollectionView
        cvwEntries.dataSource = self
        cvwEntries.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cvwEntries.reloadData()
    }
    
// MARK: func didUpdateJournalEntry(_ entry: JournalEntry, at index: Int)
    /// Called when a journal entry is updated
    func didUpdateJournalEntry(_ entry: JournalEntry, at index: Int) {
        journalEntries[index] = entry
//      cvwEntries.reloadItems(at: [IndexPath(item: index, section: 0)])
        cvwEntries.reloadData()
    }
    
// MARK: override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    /// Handling of data passing from this ViewController to EntryViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEntryView",
           let destinationVC = segue.destination as? EntryViewController,
           let selectedIndexPath = cvwEntries.indexPathsForSelectedItems?.first {
            let selectedEntry = journalEntries[selectedIndexPath.item]
            destinationVC.journalEntry = selectedEntry
            destinationVC.entryIndex = selectedIndexPath.item
            destinationVC.delegate = self
        }
    }
    
// MARK: - CollectionView Code
    // Sets number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalEntries.count
    }

    // Code for cell creation
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else {
            fatalError("ERROR: Could not dequeue a cell")
        }
        
        let journal = journalEntries[indexPath.row]
        
        cell.txtTitle.text = "\(journal.title)"
        cell.txvContent.text = "\(journal.content)"
        
        // If statement to set the date text depending on entry type.
        if let weekReview = journal as? WeekReview {
            cell.txtDate.text = "Week \(weekReview.week) of \(weekReview.year)"
        } else if let monthReview = journal as? MonthReview {
            let monthName = DateFormatter().monthSymbols[monthReview.month - 1]
            cell.txtDate.text = "\(monthName) \(monthReview.year)"
        } else if let yearReview = journal as? YearReview {
            cell.txtDate.text = "\(yearReview.year)"
        } else {
            cell.txtDate.text = journal.date.formatted(date: .long, time: .omitted)
        }
        
        // Cell Styling
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 12
        
        return cell
    }
}
