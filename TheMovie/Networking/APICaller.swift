//
//  APICaller.swift
//  TheMovie
//
//  Created by dana nur fiqi on 17/09/23.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        
        let urlString = Endpoint.getTrendingMovie.getURL()
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Authorization" : NetworkConstant.shared.AUTH_KEY]
        
        URLSession.shared.dataTask(with: request) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
    static func getVideos(movieId: String, completionHandler: @escaping (_ result: Result<VideosMovieModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.BASE_URL + "movie/\(movieId)/videos"
        print("cek url string => \(urlString)")
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Authorization" : NetworkConstant.shared.AUTH_KEY]
        
        URLSession.shared.dataTask(with: request) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(VideosMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
    
    static func getReview(movieId: String, completionHandler: @escaping (_ result: Result<ReviewMovieModel, NetworkError>) -> Void) {
        
        
        let urlString = NetworkConstant.shared.BASE_URL + "movie/\(movieId)/reviews"
        print("cek url string review => \(urlString)")
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Authorization" : NetworkConstant.shared.AUTH_KEY]
        
        URLSession.shared.dataTask(with: request) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(ReviewMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
