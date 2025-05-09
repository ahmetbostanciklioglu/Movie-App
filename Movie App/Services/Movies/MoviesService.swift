//
//  MoviesService.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import Foundation

protocol MoviesService {
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
}
