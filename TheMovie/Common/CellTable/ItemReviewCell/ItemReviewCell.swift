//
//  ItemReviewCell.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation
import UIKit

class ItemReviewCell: UITableViewCell{
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblContent: UILabel!
    
    
    static let identifier = "ItemReviewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ItemReviewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
