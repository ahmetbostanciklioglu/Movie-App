//
//  MovieSearchState.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import SwiftUI
import Combine

class MovieSearchViewModel: ObservableObject {

    @Published var query = ""
    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private var subscriptionToken: AnyCancellable?
    
    let searchService: SearchService?
    
    init(searchService: SearchService = SearchServiceImpl.shared) {
        self.searchService = searchService
    }
    
    func startObserve() {
        guard subscriptionToken == nil else {
            return
        }
        
        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.movies = nil
                self?.error = nil
                return text
            }
            .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in
                self?.search(query: $0 )
            }
    }
    
    func search(query: String) {
        self.movies = nil
        self.isLoading = false
        self.error = nil
        
        guard !query.isEmpty else {
            return
        }
        
        self.isLoading = true
        self.searchService?.searchMovie(query: query) {  [weak self] (result) in
            guard let self, self.query == query else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let movies):
                self.movies = movies.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}
