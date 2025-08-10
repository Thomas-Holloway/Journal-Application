//
//  EntrySearchViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 5/8/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Screen for searching through all journal entries
class EntrySearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, EntryViewControllerDelegate {
    
    @IBOutlet weak var scbSearchBar: UISearchBar!
    @IBOutlet weak var cvwSearchResults: UICollectionView!
    
    var filteredEntries: [JournalEntry] = [] // Array to store the entries which match the search.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scbSearchBar.delegate = self
        cvwSearchResults.delegate = self
        cvwSearchResults.dataSource = self
        filteredEntries = journalEntries
    }
    
    /// Runs when an entry is clicked from the search results
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showentryfromsearch",
           let destinationVC = segue.destination as? EntryViewController,
           let selectedIndexPath = cvwSearchResults.indexPathsForSelectedItems?.first {
            
            let selectedEntry = filteredEntries[selectedIndexPath.item]
            destinationVC.journalEntry = selectedEntry
            
            // Find the index in the main array so updates go to the right place
            if let mainIndex = journalEntries.firstIndex(where: {
                $0.title == selectedEntry.title &&
                $0.content == selectedEntry.content &&
                $0.date == selectedEntry.date
            }) {
                destinationVC.entryIndex = mainIndex
            }
            
            destinationVC.delegate = self
        }
    }
    
    // MARK: - EntryViewControllerDelegate
    func didUpdateJournalEntry(_ entry: JournalEntry, at index: Int) {
        journalEntries[index] = entry
        filteredEntries = journalEntries.filter { j in
            if let searchText = scbSearchBar.text, !searchText.isEmpty {
                return j.title.localizedCaseInsensitiveContains(searchText) ||
                j.content.localizedCaseInsensitiveContains(searchText)
            }
            return true
        }
        cvwSearchResults.reloadData()
    }
    // MARK: - SearchBar Code
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredEntries = journalEntries
        } else {
            filteredEntries = journalEntries.filter { entry in
                entry.title.localizedCaseInsensitiveContains(searchText) ||
                entry.content.localizedCaseInsensitiveContains(searchText)
            }
        }
        cvwSearchResults.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Hide the keyboard

        if let text = searchBar.text, !text.isEmpty {
            filteredEntries = journalEntries.filter { entry in
                entry.title.localizedCaseInsensitiveContains(text) ||
                entry.content.localizedCaseInsensitiveContains(text)
            }
        } else {
            filteredEntries = journalEntries
        }
        cvwSearchResults.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filteredEntries = journalEntries
        cvwSearchResults.reloadData()
    }
    
    // MARK: - CollectionView Code
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredEntries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell else {
            fatalError("ERROR: Could not dequeue a cell")
        }
        
        let journal = filteredEntries[indexPath.item]
        
        cell.txtTitle.text = "\(journal.title)"
        cell.txvContent.text = "\(journal.content)"
        cell.txtDate.text = "\(journal.date.formatted())"
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 12
        
        return cell
    }
    
}
