//
//  ExtDouble.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation

extension Double {
    var valueRating : String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        return formatter.string(from: NSNumber(value: self))!
    }
}
