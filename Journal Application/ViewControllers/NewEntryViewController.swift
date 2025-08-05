// 
//  NewEntryViewController.swift
//  Journal Application
//
//  Created by Thomas Holloway on 5/8/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

///
class NewEntryViewController: UIViewController {
    
    @IBOutlet weak var txfTitle: UITextField!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txvContent: UITextView!
    @IBOutlet weak var btnEditDate: UIButton!
    
    var date: Date = Date.now
    
    @IBAction func btnEditDatePressed(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDate.text = date.formatted()
        
    }
}
