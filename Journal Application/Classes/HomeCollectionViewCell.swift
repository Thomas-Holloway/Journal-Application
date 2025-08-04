// 
//  HomeCollectionViewCell.swift
//  Journal Application
//
//  Created by Thomas Holloway on 21/7/2025
//  Swift 6.0, macOS 15.5

import Foundation
import UIKit

/// <#Description#>
class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txvContent: UITextView!
    @IBOutlet weak var txtDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

/* Label Styling */

//      Title
        txtTitle.layer.borderColor = UIColor.black.cgColor
        txtTitle.layer.borderWidth = 1

//      Content
        txvContent.layer.borderColor = UIColor.black.cgColor
        txvContent.layer.borderWidth = 1

//      Date
        txtDate.layer.borderColor = UIColor.black.cgColor
        txtDate.layer.borderWidth = 1
    }
    
}
