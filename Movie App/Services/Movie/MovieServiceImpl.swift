//
//  MovieServiceImpl.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import Foundation


class MovieServiceImpl: MovieService {
    static let shared = MovieServiceImpl()
    private init() {}
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        guard let url = URL(string: "\(Constants.baseAPIURL)/movie/\(id)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        MovieServiceDecoding.loadURLAndDecode(url: url, params: [
            "append_to_response": "videos,credits"
        ], completion: completion)
    }
}
