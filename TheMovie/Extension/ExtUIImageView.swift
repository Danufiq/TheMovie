//
//  ExtUIImageView.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadUrl(url: String, placeholder: String = "ic_movie"){
        var imageUrl = url.replacingOccurrences(of: " ", with: "%20")
        self.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: placeholder))
    }
}


