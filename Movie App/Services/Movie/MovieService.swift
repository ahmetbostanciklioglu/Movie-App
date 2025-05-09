//
//  File.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import Foundation

protocol MovieService {
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
}

