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
    
    /// Small button to search through journal entries
    @IBOutlet weak var btnSearch: UIButton!
    
// MARK: Testing Data
    let entry1: JournalEntry = JournalEntry(title: "Entry 1", content: "This is the first entry! Blah blah blah blah, blah blah blah blah. Blah blah blah blah blah.", date: Date.now, dateCreated: Date.now)
    
    let entry2: JournalEntry = JournalEntry(title: "Entry 2", content: "This is the second entry! Blah blah blah blah, blah blah blah blah. Blah blah blah blah blah. This is just some random text to fill up the space: gbhre bghjre kbgh jr eabl jg gb baerbj.", date: Date.now, dateCreated: Date.now)
    
    let entry3: JournalEntry = JournalEntry(title: "Entry 3", content: "This is the third entry! WOW, 3 entries!! This is so boring trying to write enough to test this program.", date: Date.now, dateCreated: Date.now)
    
// MARK: override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//    Add testing data to the array
        journalEntries.append(entry1)
        journalEntries.append(entry2)
        journalEntries.append(entry3)
        
//    Update the UICollectionView
        cvwEntries.dataSource = self
        cvwEntries.reloadData()
        
    }
    
// MARK: func didUpdateJournalEntry(_ entry: JournalEntry, at index: Int)
    /// <#Description#>
    func didUpdateJournalEntry(_ entry: JournalEntry, at index: Int) {
        journalEntries[index] = entry
        cvwEntries.reloadItems(at: [IndexPath(item: index, section: 0)])
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
    
// MARK: func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    /// <#Description#>
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
// MARK: func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    /// <#Description#>
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else {
            fatalError("ERROR: Could not dequeue a cell")
        }
        
        let journal = journalEntries[indexPath.row]
        
        cell.txtTitle.text = "\(journal.title)"
        cell.txvContent.text = "\(journal.content)"
        cell.txtDate.text = "\(journal.date.formatted())"
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
}
