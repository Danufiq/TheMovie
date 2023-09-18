//
//  MainMovieViewModel.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation
import RxSwift
import RxRelay

class MainMovieViewModel {
    
    var movies = BehaviorRelay<[Movie]>(value: [])
    
    func getTrendingMovie() {
        APICaller.getTrendingMovies { [weak self] result in
            switch result {
                case .success(let trendingMovieData):
                    self?.movies.accept(trendingMovieData.results)
                
                case .failure(let err):
                    print("view model getTrendingMovies err \(err)")

            }
        }
    }
}
