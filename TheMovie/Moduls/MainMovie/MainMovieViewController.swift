//
//  MainMovieViewController.swift
//  TheMovie
//
//  Created by dana nur fiqi on 16/09/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainMovieViewController : UIViewController{
    
    
    @IBOutlet weak var vwHeader: HeaderView!
    
    
    @IBOutlet weak var cvListMovie: UICollectionView!
    
    var mainMovieViewModel = MainMovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMovieViewModel.getTrendingMovie()
        setUpView()
        
    }
    
    func setUpView(){
        vwHeader.imgBack.isHidden = true
        vwHeader.lblTitle.text = "Trending Movie"
        let nib = UINib(nibName: "ItemMovieCell", bundle: nil)
        cvListMovie.register(nib, forCellWithReuseIdentifier: ItemMovieCell.identifier)
        cvListMovie.delegate = self
        mainMovieViewModel.movies.bind(to: cvListMovie.rx.items(cellIdentifier: "ItemMovieCell", cellType: ItemMovieCell.self)){row, movies, cell in
            cell.imgMovie.loadUrl(url: "\(NetworkConstant.shared.BASE_URL_IMG)\(movies.posterPath)")
            cell.lblTitleMovie.text = movies.title
            cell.lblRatingMovie.text = "\(movies.voteAverage.valueRating)/10 IMDb"
        }
        
    }
    
}


//MARK: - Extension UICollectionview MainMovieViewController
extension MainMovieViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 283)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cek selected dana \(indexPath) =>\(mainMovieViewModel.movies.value[indexPath.row])")
        let vc = InformationMovieViewController()
        vc.movie = mainMovieViewModel.movies.value[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


