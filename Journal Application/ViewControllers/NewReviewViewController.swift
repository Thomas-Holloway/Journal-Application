//
//  NewReviewViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 5/8/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Screen for creating a new review
class NewReviewViewController: UIViewController {
    
    var reviewType: String?
    var date: Date = Date.now
    var dateComponents: DateComponents?
    
    @IBOutlet weak var txfTitle: UITextField!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txvContent: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(customBackTapped))
        navigationItem.leftBarButtonItem = customBackButton
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekOfYear, .month, .year], from: date)
        self.dateComponents = components
        
        /// Sets the date label text depending on the review type
        switch reviewType {
        case "week":
            if let week = components.weekOfYear, let year = components.year {
                let suffix: String
                switch week % 10 {
                case 1 where week != 11: suffix = "st"
                case 2 where week != 12: suffix = "nd"
                case 3 where week != 13: suffix = "rd"
                default: suffix = "th"
                }
                lblDate.text = "\(week)\(suffix) week of \(year)"
            }
        case "month":
            if let month = components.month, let year = components.year {
                let monthName = DateFormatter().monthSymbols[month - 1]
                lblDate.text = "\(monthName) \(year)"
            }
        case "year":
            if let year = components.year {
                lblDate.text = "\(year)"
            }
        default:
            print("Unknown review type")
        }
        
        txfTitle.layer.borderColor = UIColor.black.cgColor
        txfTitle.layer.borderWidth = 1
        txfTitle.layer.cornerRadius = 8
        
        lblDate.layer.borderColor = UIColor.black.cgColor
        lblDate.layer.borderWidth = 1
        lblDate.layer.cornerRadius = 8
        
        txvContent.layer.borderColor = UIColor.black.cgColor
        txvContent.layer.borderWidth = 1
        txvContent.layer.cornerRadius = 8
        
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        switch reviewType {
        case "week":
            saveWeekReview()
        case "month":
            saveMonthReview()
        case "year":
            saveYearReview()
        default:
            print("OOPS")
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Save functions for each review type
    func saveWeekReview() {
        guard let components = dateComponents,
              let week = components.weekOfYear,
              let year = components.year else {
            print("Invalid date components for week")
            return
        }
        
        let title = txfTitle.text ?? "Untitled"
        let content = txvContent.text!
        let newEntry = WeekReview(title: title, content: content, date: date, dateCreated: date, week: week, year: year)
        journalEntries.append(newEntry)
    }
    
    func saveMonthReview() {
        guard let components = dateComponents,
              let month = components.month,
              let year = components.year else {
            print("Invalid date components for month")
            return
        }
        
        let title = txfTitle.text ?? "Untitled"
        let content = txvContent.text!
        let newEntry = MonthReview(title: title, content: content, date: date, dateCreated: date, month: month, year: year)
        journalEntries.append(newEntry)
    }
    
    func saveYearReview() {
        guard let components = dateComponents,
              let year = components.year else {
            print("Invalid date components for year")
            return
        }
        
        let title = txfTitle.text ?? "Untitled"
        let content = txvContent.text!
        let newEntry = YearReview(title: title, content: content, date: date, dateCreated: date, year: year)
        journalEntries.append(newEntry)
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
