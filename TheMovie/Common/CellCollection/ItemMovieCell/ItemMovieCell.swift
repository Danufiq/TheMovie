//
//  ItemMovieCell.swift
//  TheMovie
//
//  Created by dana nur fiqi on 17/09/23.
//

import Foundation
import UIKit

  class ItemMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var vwContent: UIView!
    
    
    @IBOutlet weak var imgMovie: UIImageView!
    
    @IBOutlet weak var lblTitleMovie: UILabel!
    
    @IBOutlet weak var lblRatingMovie: UILabel!
    
    static let identifier = "ItemMovieCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ItemMovieCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwContent.layer.borderWidth = 1
        vwContent.layer.borderColor = UIColor.white.cgColor
        vwContent.layer.cornerRadius = 10
    }
     
    
}
