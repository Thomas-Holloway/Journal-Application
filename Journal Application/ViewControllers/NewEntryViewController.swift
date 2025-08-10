//
//  NewEntryViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 5/8/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Screen for creating a new entry
class NewEntryViewController: UIViewController {
    
    
    @IBOutlet weak var txfTitle: UITextField!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txvContent: UITextView!
    @IBOutlet weak var btnEditDate: UIButton!
    
    var date: Date = Date.now
    
    @IBAction func btnEditDatePressed(_ sender: Any) {

    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        saveEntry()
        navigationController?.popViewController(animated: true)
    }
    
    /// Function for saving the journal entry
    func saveEntry() {
        let title = txfTitle.text
        let content = txvContent.text!
        let newEntry: JournalEntry = .init(title: title ?? "Untitled", content: content, date: date, dateCreated: date)
        journalEntries.append(newEntry)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDate.text = date.formatted()
        
        txfTitle.layer.borderColor = UIColor.black.cgColor
        txfTitle.layer.borderWidth = 1
        txfTitle.layer.cornerRadius = 8
        
        lblDate.layer.borderColor = UIColor.black.cgColor
        lblDate.layer.borderWidth = 1
        lblDate.layer.cornerRadius = 8
        
        txvContent.layer.borderColor = UIColor.black.cgColor
        txvContent.layer.borderWidth = 1
        txvContent.layer.cornerRadius = 8
        
        // Creates a custom back button
        let customBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(customBackTapped))
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDatePicker",
           let destination = segue.destination as? EntryDateChangeViewController {
            destination.newDate = date // pass current selected date
            destination.delegate = self
        }
    }
    
    // MARK: - Back Button Tapped
    // Code ran when the custom back button is pressed. Confirms if you want to discard changes.
    @objc func customBackTapped() {
        let alert = UIAlertController(title: "Discard Changes?", message: "Are you sure you want to discard the changes you made to this entry?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Discard", style: .destructive, handler: { _ in self.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
    }
}

extension NewEntryViewController: EntryDateChangeViewControllerDelegate {
    func didChangeEntryDate(to newDate: Date) {
        date = newDate
        lblDate.text = newDate.formatted()
    }
}
