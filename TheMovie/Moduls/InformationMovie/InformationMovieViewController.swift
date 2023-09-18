//
//  InformationMovieViewController.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation
import UIKit
import YouTubePlayer

class InformationMovieViewController: UIViewController {
    
    @IBOutlet weak var vwHeader: HeaderView!
    
    @IBOutlet weak var vwYTPlayer: YouTubePlayerView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    
    @IBOutlet weak var lblValueOverview: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    
    @IBOutlet weak var lblContent: UILabel!
    
    
    
    var informationMovieViewModel = InformationMovieViewModel()
    
    var movie : Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI()
        setUpView()
    }
    
    func fetchAPI(){
        if let dataMovieID = movie {
            informationMovieViewModel.getVideos(movieId: "\(dataMovieID.id)")
            informationMovieViewModel.getReview(movieId: "\(dataMovieID.id)")
        }
    }
    
    
    func setUpView(){
        vwHeader.lblTitle.text = "Information Movie"
        vwHeader.delegate = self
        informationMovieViewModel.videos.subscribe(onNext: { videos in
            if let video = videos {
                print("cek videosss view \(video)")
                self.vwYTPlayer.loadVideoID(video.key)
            }

        })
        if let dataMovie = movie {
            lblTitle.text = dataMovie.title
            lblRating.text = "\(dataMovie.voteAverage.valueRating)/10 IMDb"
            lblValueOverview.text = dataMovie.overview
        }
        
        informationMovieViewModel.review.subscribe(onNext: { reviews in
            if let review = reviews {
                self.lblAuthor.text = review.author
                self.lblContent.text = review.content
            }

        })
        
    }
    
}

extension InformationMovieViewController: HeaderViewDelegate{
    func pressBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
