// 
//  EntryViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 28/7/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Screen for viewing and/or editing full entries.
/// Recieves information about the journal entry to display from the Home View
class EntryViewController: UIViewController {
    
    /// <#Description#>
    var journalEntry: JournalEntry?
    /// <#Description#>
    var entryIndex: Int?
    /// <#Description#>
    weak var delegate: EntryViewControllerDelegate?
    
    @IBOutlet weak var txfEntryTitle: UITextField!
    @IBOutlet weak var lblEntryDate: UILabel!
    @IBOutlet weak var txvEntryContent: UITextView!
    
// MARK: override func viewDidLoad()
    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = journalEntry {
            txfEntryTitle.text = entry.title
            txvEntryContent.text = entry.content
            lblEntryDate.text = entry.date.formatted()
        }
    
/* Label Styling */

//      Title
        txfEntryTitle.layer.borderColor = UIColor.black.cgColor
        txfEntryTitle.layer.borderWidth = 1
        txfEntryTitle.layer.cornerRadius = 8

//      Date
        lblEntryDate.layer.borderColor = UIColor.black.cgColor
        lblEntryDate.layer.borderWidth = 1
        lblEntryDate.layer.cornerRadius = 8

//      Content
        txvEntryContent.layer.borderColor = UIColor.black.cgColor
        txvEntryContent.layer.borderWidth = 1
        txvEntryContent.layer.cornerRadius = 8
        
    }

// MARK: override func viewWillDisappear(_ animated: Bool)
    /// <#Description#>
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            guard let updatedText = txvEntryContent.text,
                  let heading = txfEntryTitle.text,
                  let entryIndex = entryIndex else { return }
            
            let updatedEntry = JournalEntry(title: heading, content: updatedText, date: Date.now, dateCreated: Date.now)
            delegate?.didUpdateJournalEntry(updatedEntry, at: entryIndex)
        }
    }
}

// MARK: protocol EntryViewControllerDelegate: AnyObject

/// <#Description#>
protocol EntryViewControllerDelegate: AnyObject {
    func didUpdateJournalEntry(_ entry: JournalEntry, at index: Int)
}
