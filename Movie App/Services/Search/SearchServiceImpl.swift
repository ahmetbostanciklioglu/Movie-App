//
//  SearchServiceImpl.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import Foundation


class SearchServiceImpl: SearchService {
    static let shared = SearchServiceImpl()
    private init() {}
    
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = URL(string: "\(Constants.baseAPIURL)/search/movie") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        MovieServiceDecoding.loadURLAndDecode(url: url, params: [
            "language": "en-US",
            "include_adult": "false",
            "region": "US",
            "query": query
        ], completion: completion)
    }
}
