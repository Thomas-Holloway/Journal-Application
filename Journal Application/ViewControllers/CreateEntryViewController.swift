// 
//  CreateEntryViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 19/7/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// Screen for creating a new journal entry, 
class CreateEntryViewController: UIViewController {
    
    @IBOutlet weak var btnNewEntry: UIButton!
    @IBOutlet weak var btnNewWeeklyReview: UIButton!
    @IBOutlet weak var btnNewMonthlyReview: UIButton!
    @IBOutlet weak var btnNewYearlyReview: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    /// Handles review entry creation types
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createWeeklyReview",
           let destinationVC = segue.destination as? NewReviewViewController {
            destinationVC.reviewType = "week"
        }
        if segue.identifier == "createMonthlyReview",
           let destinationVC = segue.destination as? NewReviewViewController {
            destinationVC.reviewType = "month"
        }
        if segue.identifier == "createYearlyReview",
           let destinationVC = segue.destination as? NewReviewViewController {
            destinationVC.reviewType = "year"
        }
    }
}
