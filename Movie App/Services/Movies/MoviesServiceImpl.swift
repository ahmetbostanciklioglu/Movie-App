//
//  MoviesServiceImpl.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import Foundation

class MoviesServiceImpl: MoviesService {
    static let shared = MoviesServiceImpl()
    private init() {}
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = URL(string: "\(Constants.baseAPIURL)/movie/\(endpoint.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        MovieServiceDecoding.loadURLAndDecode(url: url, completion: completion)
    }

}
