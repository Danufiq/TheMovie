//
//  InformationMovieViewModel.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class InformationMovieViewModel {
    var videos = BehaviorRelay<Videos?>(value: nil)
    var review = BehaviorRelay<Review?>(value: nil)
    
    func getVideos(movieId: String) {
        APICaller.getVideos(movieId: movieId, completionHandler: { [weak self] result in
            switch result {
                case .success(let videosMovieModel):
                if videosMovieModel.results.count > 0 {
                    print("cek video view model \(videosMovieModel.results[0])")
                    self?.videos.accept(videosMovieModel.results[0])
                }
                case .failure(let err):
                print("view model getVideos err \(err)")
            }
        })
    }
    
    func getReview(movieId: String) {
        APICaller.getReview(movieId: movieId, completionHandler: { [weak self] result in
            switch result {
                case .success(let reviewMovieModel):
                if reviewMovieModel.results.count > 0 {
                    self?.review.accept(reviewMovieModel.results[0])
                }
                case .failure(let err):
                print("view model getReview err \(err)")
            }
        })
    }
}

