//
//  SearchService.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import Foundation

protocol SearchService {
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
}
