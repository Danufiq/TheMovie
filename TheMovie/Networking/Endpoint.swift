//
//  Endpoint.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation

enum Endpoint: String {
    case getTrendingMovie = "trending/movie/day?language=en-US"
    
    func getURL() -> String{
        return "\(NetworkConstant.shared.BASE_URL)\(self.rawValue)"
    }
    
    
}
